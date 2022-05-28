import 'dart:convert';

import 'package:file/file.dart';
import 'package:file/local.dart';

import 'use_case_data.dart';

class UseCaseParser {
  final FileSystem fileSystem;

  UseCaseParser({
    this.fileSystem = const LocalFileSystem(),
  });

  Iterable<UseCaseData> _getUseCasesFromFiles(List<File> files) sync* {
    for (final file in files) {
      Iterable items = json.decode(
        file.readAsStringSync(),
      );
      List<UseCaseData> useCases = List<UseCaseData>.from(
        items.map(
          (model) => UseCaseData.fromJson(model),
        ),
      );

      yield* useCases;
    }
  }

  List<UseCaseData> parse(String path) {
    if (fileSystem.isDirectorySync(path)) {
      final files = fileSystem
          .directory(path)
          .listSync(recursive: true)
          .whereType<File>()
          .where(
            (File file) => file.path.endsWith('.usecase.widgetbook.json'),
          )
          .toList();
      final useCases = _getUseCasesFromFiles(files).toList();
      return useCases;
    }

    return [];
  }
}
