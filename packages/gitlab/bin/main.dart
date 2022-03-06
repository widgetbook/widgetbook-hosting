import 'dart:io';

import 'package:helper/helper.dart';

import 'gitlab_deployment_parser.dart';

Future<void> main(List<String> arguments) async {
  final deploymentData = GitlabDeploymentParser().parse();
  final buildPath = parseBuildPath();

  final directory = Directory(buildPath);

  final file = WidgetbookZipEncoder().encode(directory);
  if (file != null) {
    await WidgetbookHttpClient().uploadDeployment(
      deploymentFile: file,
      data: deploymentData,
    );
  } else {
    print('Could not create .zip file for upload.');
  }
}

String parseBuildPath() {
  final buildPath = Platform.environment['WIDGETBOOK_BUILD_PATH'];

  if (buildPath == null) {
    throw Exception('Could not parse build path');
  }

  return buildPath;
}
