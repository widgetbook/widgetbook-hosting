/// Data required for a deployment
class DeploymentData {
  /// Creates a new instance of [DeploymentData].
  DeploymentData({
    required this.branchName,
    required this.repositoryName,
    required this.commitSha,
    required this.actor,
    required this.provider,
  });

  /// Name of the branch
  final String branchName;

  /// Name of the repository
  final String repositoryName;

  /// The sha of the commit
  final String commitSha;

  /// Name of the username at the [provider].
  final String actor;

  /// Git cloud provider e.g. GitHub, GitLab, etc
  final String provider;
}
