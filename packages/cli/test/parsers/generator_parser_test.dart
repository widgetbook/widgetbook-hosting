import 'package:file/memory.dart';
import 'package:file/src/interface/file_system.dart';
import 'package:test/test.dart';

import '../../bin/parsers/generator_parser.dart';

class TestGenerator extends GeneratorParser {
  TestGenerator({
    required String projectPath,
    required FileSystem fileSystem,
  }) : super(projectPath: projectPath, fileSystem: fileSystem);

  @override
  Future<List> parse() {
    throw UnimplementedError();
  }
}

void main() {
  late TestGenerator generator;

  const projectPath = 'projectPath';

  setUp(
    () {
      generator = TestGenerator(
        projectPath: projectPath,
        fileSystem: MemoryFileSystem(),
      );
    },
  );

  group(
    '$GeneratorParser',
    () {
      test(
        'generatedFolderPath returns correct path',
        () {
          expect(
            generator.generatedFolderPath,
            equals('$projectPath/.dart_tool/build/generated'),
          );
        },
      );
    },
  );
}
