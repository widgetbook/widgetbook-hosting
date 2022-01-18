import 'dart:io';

import 'package:helper/helper.dart';
import 'package:path/path.dart' as path;

import 'bitbucket_deployment_parser.dart';

Future<void> main(List<String> arguments) async {
  final deploymentData = BitbucketDeploymentParser().parse();
  final apiKey = parseApiKey();
  final buildPath = parseBuildPath();

  final fullPath = path.join(
    'builds',
    deploymentData.repositoryName,
    buildPath,
  );

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
