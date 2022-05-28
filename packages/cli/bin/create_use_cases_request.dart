import 'package:freezed_annotation/freezed_annotation.dart';

import 'use_case_data.dart';

part 'create_use_cases_request.freezed.dart';
part 'create_use_cases_request.g.dart';

@freezed
class CreateUseCasesRequest with _$CreateUseCasesRequest {
  factory CreateUseCasesRequest({
    required String apiKey,
    required List<UseCaseData> useCases,
    required String buildId,
    required String projectId,
  }) = _CreateUseCasesRequest;

  factory CreateUseCasesRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUseCasesRequestFromJson(json);
}
