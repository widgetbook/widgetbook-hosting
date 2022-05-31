import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:parser/parser.dart';
import 'package:path/path.dart';

import 'create_use_cases_request.dart';
import 'use_case_data.dart';

/// A client to connect to the Widgetbook Cloud backend
class WidgetbookHttpClient {
  /// Creates a new instance of [WidgetbookHttpClient].
  WidgetbookHttpClient({
    Dio? client,
  }) : client = client ?? Dio() {
    this.client.options.baseUrl = const bool.fromEnvironment('dart.vm.product')
        ? 'https://api.widgetbook.io/v1/'
        : 'http://localhost:3000/v1/';
  }

  /// underlying [Dio] client
  final Dio client;

  Future<void> uploadUseCases({
    required String apiKey,
    required List<UseCaseData> useCases,
    required String buildId,
    required String projectId,
    required String baseBranch,
    required String refBranch,
    required String baseSha,
    required String refSha,
  }) async {
    if (useCases.isNotEmpty) {
      await client.post<dynamic>(
        '/builds/use-cases',
        data: CreateUseCasesRequest(
          apiKey: apiKey,
          useCases: useCases,
          buildId: buildId,
          projectId: projectId,
          baseBranch: baseBranch,
          refBranch: refBranch,
          baseSha: baseSha,
          refSha: refSha,
        ).toJson(),
      );
    }
  }

  /// Uploads the deployment .zip file to the Widgetbook Cloud backend
  Future<Map<String, dynamic>?> uploadDeployment({
    required File deploymentFile,
    required DeploymentData data,
  }) async {
    try {
      final response = await client.post<Map<String, dynamic>>(
        '/builds/deploy',
        data: FormData.fromMap(
          <String, dynamic>{
            'file': await MultipartFile.fromFile(
              deploymentFile.path,
              filename: basename(deploymentFile.path),
              contentType: MediaType.parse('application/zip'),
            ),
            'branch': data.branchName,
            'repository': data.repositoryName,
            'actor': data.actor,
            'commit': data.commitSha,
            'version-control-provider': data.provider,
            'api-key': data.apiKey,
          },
        ),
      );
      return response.data;
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        final errorResponse = _decodeResponse(response.data);
        print(errorResponse.toString());
        exit(1);
      }
    }

    return null;
  }

  Map<String, dynamic> _decodeResponse(dynamic data) {
    if (data is String) {
      return json.decode(data) as Map<String, dynamic>;
    }
    return data as Map<String, dynamic>;
  }
}
