import 'package:parser/parser.dart';

class GitlabDeploymentParser extends DeploymentParser {
  @override
  DeploymentData parseData(Map<String, String> map) {
    final actor = map['GITLAB_USER_LOGIN'];
    final branchName = map['CI_COMMIT_BRANCH'];
    final repositoryName = map['CI_PROJECT_PATH'];
    final commitSha = map['CI_COMMIT_SHA'];

    if (actor == null ||
        branchName == null ||
        repositoryName == null ||
        commitSha == null) {
      throw Exception('Not able to find expected information');
    }

    return DeploymentData(
      actor: actor,
      branchName: branchName,
      commitSha: commitSha,
      repositoryName: repositoryName,
      provider: 'GitLab',
    );
  }
}
