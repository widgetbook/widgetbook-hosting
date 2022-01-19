import 'dart:io';

import 'package:parser/src/models/deployment_data.dart';

/// Parses environment variables into [DeploymentData].
abstract class DeploymentParser {
  /// Creates a new instance of [DeploymentParser].
  const DeploymentParser();

  /// parses a map of environment data into [DeploymentData].
  DeploymentData parseData(Map<String, String> map);

  /// Retrieves environment variables and parses them into [DeploymentData].
  DeploymentData parse() {
    final environmentMap = Platform.environment;
    return parseData(environmentMap);
  }
}
