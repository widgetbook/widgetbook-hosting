import 'package:dio/dio.dart';

class HttpClient {
  final Dio client;

  HttpClient({
    Dio? client,
  }) : client = client ?? Dio();

  Future<void> uploadDeployment() async {
    await client.post<dynamic>(
      '/hosting',
      data: FormData.fromMap(
        <String, dynamic>{
          'file': await MultipartFile.fromFile(
            '',
            filename: 'widgetbook.zip',
          ),
          'branch': 'a',
          'repository': 'a',
          'actor': 'a',
          'commit': 'a',
          'workflowOS': 'a',
        },
      ),
    );
  }
}
