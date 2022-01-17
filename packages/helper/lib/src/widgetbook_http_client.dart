import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:parser/parser.dart';
import 'package:path/path.dart';

class WidgetbookHttpClient {
  /// Creates a new instance of [WidgetbookHttpClient].
  WidgetbookHttpClient({
    Dio? client,
    required String apiKey,
  }) : client = client ?? Dio() {
    this.client.options.baseUrl = const bool.fromEnvironment('dart.vm.product')
        ? 'https://api.widgetbook.io/v1/'
        : 'http://localhost:8080/v1/';

    this.client.options.headers.putIfAbsent(
          'Authorization',
          () => 'Bearer $apiKey',
        );
  }

  final Dio client;

  Future<void> uploadDeployment({
    required File deploymentFile,
    required DeploymentData data,
  }) async {
    try {
      await client.post<dynamic>(
        '/hosting',
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
            'repository-provider': data.provider,
          },
        ),
      );
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        final errorResponse = _decodeResponse(response.data);
        print(errorResponse.toString());
        exit(1);
      }
    }
  }

  Map<String, dynamic> _decodeResponse(dynamic data) {
    if (data is String) {
      return json.decode(data) as Map<String, dynamic>;
    }
    return data as Map<String, dynamic>;
  }
}
