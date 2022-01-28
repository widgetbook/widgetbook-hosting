import 'dart:io';

import 'package:parser/parser.dart';

class GithubDeploymentParser extends DeploymentParser {
  @override
  DeploymentData parseData(Map<String, String> map) {
    final actor = map['GITHUB_ACTOR'];
    final branchName = map['GITHUB_REF_NAME'];
    final repositoryName = map['GITHUB_REPOSITORY'];
    final commitSha = map['GITHUB_SHA'];

    if (actor == null ||
        branchName == null ||
        repositoryName == null ||
        commitSha == null) {
      print('Unable to find expected information.');
      exit(64);
    }

    return DeploymentData(
      actor: actor,
      branchName: branchName,
      commitSha: commitSha,
      repositoryName: repositoryName,
      provider: 'GitHub',
    );
  }
}
