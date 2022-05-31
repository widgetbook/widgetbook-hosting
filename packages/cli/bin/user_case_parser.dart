import 'dart:convert';

import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:git/git.dart';
import 'package:path/path.dart' as p;

import 'use_case_data.dart';

class UseCaseParser {
  final FileSystem fileSystem;

  UseCaseParser({
    this.fileSystem = const LocalFileSystem(),
  });

  UseCaseData _getUseCase(dynamic data) {
    final stringData = json.encode(data);
    final correctData = json.decode(stringData);
    return UseCaseData.fromJson(correctData);
  }

  Iterable<UseCaseData> _getUseCasesFromFiles(List<File> files) sync* {
    for (final file in files) {
      final items = json.decode(
        file.readAsStringSync(),
      ) as Iterable;
      final list = items.toList();
      List<UseCaseData> useCases = List<UseCaseData>.from(
        items.map(
          (model) => _getUseCase(model),
        ),
      );

      yield* useCases;
    }
  }

  Future<List<UseCaseData>> parse(String path) async {
    path =
        '/Users/jenshorstmann/Files/Work/repos/widgetbook/widgetbook_comparison_demo';
    var generatorPath = p.join(
      path,
      '.dart_tool',
      'build',
      'generated',
    );

    if (fileSystem.isDirectorySync(generatorPath)) {
      final files = fileSystem
          .directory(generatorPath)
          .listSync(recursive: true)
          .whereType<File>()
          .where(
            (File file) => file.path.endsWith('.usecase.widgetbook.json'),
          )
          .toList();
      final useCases = _getUseCasesFromFiles(files).toList();

      if (!await GitDir.isGitDir(path)) {
        // TODO exit program
      }
      final gitDir = await GitDir.fromExisting(
        path,
        allowSubdirectory: true,
      );

      final fileDiffs = await gitDir.diff();
      final mainFile = fileDiffs.first;
      final useCase = useCases.last;

      final changedUseCases = <UseCaseData>[];

      // TODO this is inefficient
      for (final useCase in useCases) {
        for (final diff in fileDiffs) {
          if (!diff.isRemoved &&
              useCase.widgetFilePath.endsWith(diff.pathRef!)) {
            // TODO this only adds use cases where the source file changed
            // however this should also include the source file where the
            // annotation was used since this is also part of the use case!
            changedUseCases.add(useCase);
            break;
          }

          if (diff.isRemoved &&
              useCase.widgetFilePath.endsWith(diff.pathBase!)) {
            // TODO this only adds use cases where the source file changed
            // however this should also include the source file where the
            // annotation was used since this is also part of the use case!
            changedUseCases.add(useCase);
            break;
          }
        }
      }

      return changedUseCases;
    }

    return [];
  }
}
