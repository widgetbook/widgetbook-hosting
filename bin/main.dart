import 'dart:io';

import 'package:args/args.dart';

void main(List<String> arguments) {
  print('Arguments');
  print(arguments);

  final parser = ArgParser()
    ..addOption(
      'path',
      mandatory: true,
    );

  final parsedArguments = parser.parse(arguments);

  final path = parsedArguments['path'] as String;

  final env = Platform.environment;
  final branch = env['GITHUB_REF_NAME'];
  final actionVersion = env['GITHUB_ACTION_REF'];

  /// the user e.g. JensHor
  final actor = env['GITHUB_ACTOR'];
  final commitSha = env['GITHUB_SHA'];
  final repository = env['GITHUB_REPOSITORY'];
  final latestCommit = env['INPUT_LATESTCOMMIT'];
  final runnerOS = env['RUNNER_OS'];

  print('Branch: $branch');
  print('Commit: $commitSha');
  print('User: $actor');
  print('Repository: $repository');
  print('Latest Commit: $latestCommit');

  print('Version: $actionVersion');
  print('Runner OS: $runnerOS');

  print('Path: $path');
}
