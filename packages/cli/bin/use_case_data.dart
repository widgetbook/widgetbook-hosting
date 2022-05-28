import 'package:freezed_annotation/freezed_annotation.dart';

part 'use_case_data.freezed.dart';
part 'use_case_data.g.dart';

@freezed
class UseCaseData with _$UseCaseData {
  factory UseCaseData({
    required String widgetName,
    required String storyName,
    required String widgetFilePath,
  }) = _UseCaseData;

  factory UseCaseData.fromJson(Map<String, dynamic> json) =>
      _$UseCaseDataFromJson(json);
}
