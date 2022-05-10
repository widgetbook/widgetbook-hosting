import 'dart:io';

import 'package:args/args.dart';
import 'package:helper/helper.dart';
import 'package:parser/parser.dart';

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

  final directory = Directory(path);

  final file = WidgetbookZipEncoder().encode(directory);
  if (file != null) {
    await WidgetbookHttpClient().uploadDeployment(
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
  } else {
    print('Could not create .zip file for upload.');
  }
}
