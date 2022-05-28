
import 'package:freezed_annotation/freezed_annotation.dart';

part 'component.freezed.dart';
part 'component.g.dart';

@freezed
class Component with _$Component {
  factory Component() = _Component;
	
  factory Component.fromJson(Map<String, dynamic> json) =>
			_$ComponentFromJson(json);
}
