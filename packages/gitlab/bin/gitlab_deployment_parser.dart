import 'package:parser/parser.dart';

class GitlabDeploymentParser extends DeploymentParser {
  @override
  DeploymentData parseData(Map<String, String> map) {
    final actor = map['GITLAB_USER_LOGIN'];
    final branchName = map['CI_COMMIT_BRANCH'];
    final repositoryName = map['CI_PROJECT_PATH'];
    final commitSha = map['CI_COMMIT_SHA'];
    final apikey = map['WIDGETBOOK_API_KEY'];

    if (actor == null ||
        branchName == null ||
        repositoryName == null ||
        commitSha == null ||
        apikey == null) {
      throw Exception('Not able to find expected information');
    }

    return DeploymentData(
      actor: actor,
      branchName: branchName,
      commitSha: commitSha,
      repositoryName: repositoryName,
      provider: 'GitLab',
      apiKey: apikey,
    );
  }
}
