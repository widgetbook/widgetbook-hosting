import 'dart:io';

import 'package:helper/helper.dart';
import 'package:path/path.dart' as path;

import 'gitlab_deployment_parser.dart';

void main(List<String> arguments) async {
  final deploymentData = GitlabDeploymentParser().parse();
  final apiKey = parseApiKey();
  final buildPath = parseBuildPath();

  final fullPath = path.join(
    'builds',
    deploymentData.repositoryName,
    buildPath,
  );

  print('Branch: ${deploymentData.branchName}');
  print('Commit: ${deploymentData.commitSha}');
  print('User: ${deploymentData.actor}');
  print('Repository: ${deploymentData.repositoryName}');

  print('Build Path: $buildPath');
  print('Path: $fullPath');

  final directory = Directory(fullPath);
  final file = WidgetbookZipEncoder().encode(directory);
  if (file != null) {
    await WidgetbookHttpClient(apiKey: apiKey).uploadDeployment(
      deploymentFile: file,
      data: deploymentData,
    );
  } else {
    print('Could not create .zip file for upload.');
  }
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
