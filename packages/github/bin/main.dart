import 'dart:io';

import 'package:args/args.dart';
import 'package:helper/helper.dart';

import 'github_deployment_parser.dart';

void main(List<String> arguments) async {
  print('Arguments');
  print(arguments);

  final parser = ArgParser()
    ..addOption(
      'path',
      mandatory: true,
    )
    ..addOption(
      'api_key',
      mandatory: true,
    );

  final parsedArguments = parser.parse(arguments);

  print(parsedArguments.arguments);

  final path = parsedArguments['path'] as String;
  final apiKey = parsedArguments['api_key'] as String;
  final directory = Directory(path);

  final deploymentData = GithubDeploymentParser().parse();

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
