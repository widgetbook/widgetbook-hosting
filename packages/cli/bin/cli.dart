import 'dart:io';

import 'package:args/args.dart';
import 'package:parser/parser.dart';
import 'package:path/path.dart' as p;

import 'user_case_parser.dart';
import 'widgetbook_http_client.dart';
import 'widgetbook_zip_encoder.dart';

void main(List<String> arguments) async {
  final parser = ArgParser();
  parser
    ..addFlag(
      'help',
      abbr: 'h',
      help: 'Prints this information',
      callback: (isEnabled) {
        if (isEnabled) {
          print(parser.usage);
          exit(64);
        }
      },
    )
    ..addOption(
      'path',
      help: 'The path to the build folder of your application.',
      defaultsTo: './build/web',
    )
    ..addOption(
      'api-key',
      help: 'The project specific API key for Widgetbook Cloud.',
      mandatory: true,
    )
    ..addOption(
      'branch',
      help: 'The name of the branch for which the Widgetbook is uploaded.',
      mandatory: true,
    )
    ..addOption(
      'repository',
      help: 'The name of the repository for which the Widgetbook is uploaded.',
      mandatory: true,
    )
    ..addOption(
      'commit',
      help: 'The SHA hash of the commit for which the Widgetbook is uploaded.',
      mandatory: true,
    )
    ..addOption(
      'actor',
      help: 'The username of the actor which triggered the build.',
      mandatory: true,
    )
    ..addOption(
      'git-provider',
      help: 'The name of the Git provider.',
      mandatory: true,
      allowed: [
        'GitHub',
        'GitLab',
        'BitBucket',
        'Azure',
        // CLI is for users running the command locally.
        'CLI',
      ],
    );

  final args = parser.parse(arguments);

  final path = args['path'] as String;
  final apiKey = args['api-key'] as String;
  final branch = args['branch'] as String;
  final repository = args['repository'] as String;
  final commit = args['commit'] as String;
  final actor = args['actor'] as String;
  final gitProvider = args['git-provider'] as String;

  final buildPath = p.join(
    path,
    'build',
    'web',
  );
  final generatedPath = p.join(
    path,
    '.dart_tool',
    'build',
    'generated',
  );

  final directory = Directory(buildPath);
  final useCases = UseCaseParser().parse(generatedPath);
  final file = WidgetbookZipEncoder().encode(directory);
  if (file != null) {
    final uploadInfo = await WidgetbookHttpClient().uploadDeployment(
      deploymentFile: file,
      data: DeploymentData(
        branchName: branch,
        repositoryName: repository,
        commitSha: commit,
        actor: actor,
        apiKey: apiKey,
        provider: gitProvider,
      ),
    );

    if (uploadInfo != null) {
      await WidgetbookHttpClient().uploadUseCases(
        apiKey: apiKey,
        useCases: useCases,
        buildId: uploadInfo['build'],
        projectId: uploadInfo['project'],
      );
    }
  } else {
    print('Could not create .zip file for upload.');
  }
}
