import 'dart:io';

import 'package:args/args.dart';
import 'package:git/git.dart';
import 'package:helper/helper.dart';
import 'package:parser/parser.dart';
import 'package:path/path.dart' as p;

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption('path', mandatory: true)
    ..addOption('api-key', mandatory: true);

  final args = parser.parse(arguments);

  final path = args['path'] as String;
  final apiKey = args['api-key'] as String;

  if (await GitDir.isGitDir(p.current)) {
    final gitDir = await GitDir.fromExisting(
      p.current,
      allowSubdirectory: true,
    );
    final branch = await gitDir.currentBranch();

    // final status = await gitDir.runCommand(['status']);
    // final asString = status.stdout as String;

    final branchName = branch.branchName;
    final sha = branch.sha;

    final directory = Directory(path);

    final file = WidgetbookZipEncoder().encode(directory);
    if (file != null) {
      await WidgetbookHttpClient().uploadDeployment(
        deploymentFile: file,
        data: DeploymentData(
          branchName: branchName,
          repositoryName: '',
          commitSha: sha,
          actor: '',
          apiKey: apiKey,
          provider: 'CLI',
        ),
      );
    } else {
      print('Could not create .zip file for upload.');
    }
  } else {
    print('Please make sure to execute this CLI within a git folder.');
  }
}
