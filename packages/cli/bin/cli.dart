import 'package:args/args.dart';
import 'package:git/git.dart';
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
    final branchName = branch.branchName;
    final sha = branch.sha;
    final int i = 9;
  } else {
    print('Please make sure to execute this CLI within a git folder.');
  }
}
