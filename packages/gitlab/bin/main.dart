import 'dart:io';

import 'gitlab_deployment_parser.dart';
import 'package:path/path.dart' as path;

void main(List<String> arguments) {
  final deploymentData = GitlabDeploymentParser().parse();
  final apiKey = parseApiKey();
  final buildPath = parseBuildPath();
  final fullPath = path.join(
    'builds',
    deploymentData.repositoryName,
    deploymentData.branchName,
    buildPath,
  );

  print('Branch: ${deploymentData.branchName}');
  print('Commit: ${deploymentData.commitSha}');
  print('User: ${deploymentData.actor}');
  print('Repository: ${deploymentData.repositoryName}');

  print('Build Path: $buildPath');
  print('Path: $fullPath');
}

String parseApiKey() {
  final apikey = Platform.environment['WIDGETBOOK_API_KEY'];

  if (apikey == null) {
    throw Exception('Could not parse API key');
  }

  return apikey;
}

String parseBuildPath() {
  final buildPath = Platform.environment['WIDGETBOOK_BUILD_PATH'];

  if (buildPath == null) {
    throw Exception('Could not parse build path');
  }

  return buildPath;
}
