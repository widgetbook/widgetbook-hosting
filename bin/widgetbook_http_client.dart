import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
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
    required String branch,
    required String repository,
    required String commit,
    required String actor,
  }) async {
    await client.post<dynamic>(
      '/hosting',
      data: FormData.fromMap(
        <String, dynamic>{
          'file': await MultipartFile.fromFile(
            deploymentFile.path,
            filename: basename(deploymentFile.path),
            contentType: MediaType.parse('application/zip'),
          ),
          'branch': branch,
          'repository': repository,
          'actor': actor,
          'commit': commit,
        },
      ),
    );
  }
}