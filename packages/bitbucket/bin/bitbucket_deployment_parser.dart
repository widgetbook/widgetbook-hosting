import 'package:parser/parser.dart';

class BitbucketDeploymentParser extends DeploymentParser {
  @override
  DeploymentData parseData(Map<String, String> map) {
    print(map);

    final actor = map['BITBUCKET_STEP_TRIGGERER_UUID'];
    final branchName = map['BITBUCKET_BRANCH'];
    final repositoryName = map['BITBUCKET_REPO_FULL_NAME'];
    final commitSha = map['BITBUCKET_COMMIT'];
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
      provider: 'BitBucket',
      apiKey: apikey,
    );
  }
}
