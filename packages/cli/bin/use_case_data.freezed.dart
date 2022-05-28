// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'use_case_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UseCaseData _$UseCaseDataFromJson(Map<String, dynamic> json) {
  return _UseCaseData.fromJson(json);
}

/// @nodoc
mixin _$UseCaseData {
  String get widgetName => throw _privateConstructorUsedError;
  String get storyName => throw _privateConstructorUsedError;
  String get widgetFilePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UseCaseDataCopyWith<UseCaseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UseCaseDataCopyWith<$Res> {
  factory $UseCaseDataCopyWith(
          UseCaseData value, $Res Function(UseCaseData) then) =
      _$UseCaseDataCopyWithImpl<$Res>;
  $Res call({String widgetName, String storyName, String widgetFilePath});
}

/// @nodoc
class _$UseCaseDataCopyWithImpl<$Res> implements $UseCaseDataCopyWith<$Res> {
  _$UseCaseDataCopyWithImpl(this._value, this._then);

  final UseCaseData _value;
  // ignore: unused_field
  final $Res Function(UseCaseData) _then;

  @override
  $Res call({
    Object? widgetName = freezed,
    Object? storyName = freezed,
    Object? widgetFilePath = freezed,
  }) {
    return _then(_value.copyWith(
      widgetName: widgetName == freezed
          ? _value.widgetName
          : widgetName // ignore: cast_nullable_to_non_nullable
              as String,
      storyName: storyName == freezed
          ? _value.storyName
          : storyName // ignore: cast_nullable_to_non_nullable
              as String,
      widgetFilePath: widgetFilePath == freezed
          ? _value.widgetFilePath
          : widgetFilePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UseCaseDataCopyWith<$Res>
    implements $UseCaseDataCopyWith<$Res> {
  factory _$$_UseCaseDataCopyWith(
          _$_UseCaseData value, $Res Function(_$_UseCaseData) then) =
      __$$_UseCaseDataCopyWithImpl<$Res>;
  @override
  $Res call({String widgetName, String storyName, String widgetFilePath});
}

/// @nodoc
class __$$_UseCaseDataCopyWithImpl<$Res> extends _$UseCaseDataCopyWithImpl<$Res>
    implements _$$_UseCaseDataCopyWith<$Res> {
  __$$_UseCaseDataCopyWithImpl(
      _$_UseCaseData _value, $Res Function(_$_UseCaseData) _then)
      : super(_value, (v) => _then(v as _$_UseCaseData));

  @override
  _$_UseCaseData get _value => super._value as _$_UseCaseData;

  @override
  $Res call({
    Object? widgetName = freezed,
    Object? storyName = freezed,
    Object? widgetFilePath = freezed,
  }) {
    return _then(_$_UseCaseData(
      widgetName: widgetName == freezed
          ? _value.widgetName
          : widgetName // ignore: cast_nullable_to_non_nullable
              as String,
      storyName: storyName == freezed
          ? _value.storyName
          : storyName // ignore: cast_nullable_to_non_nullable
              as String,
      widgetFilePath: widgetFilePath == freezed
          ? _value.widgetFilePath
          : widgetFilePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UseCaseData implements _UseCaseData {
  _$_UseCaseData(
      {required this.widgetName,
      required this.storyName,
      required this.widgetFilePath});

  factory _$_UseCaseData.fromJson(Map<String, dynamic> json) =>
      _$$_UseCaseDataFromJson(json);

  @override
  final String widgetName;
  @override
  final String storyName;
  @override
  final String widgetFilePath;

  @override
  String toString() {
    return 'UseCaseData(widgetName: $widgetName, storyName: $storyName, widgetFilePath: $widgetFilePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UseCaseData &&
            const DeepCollectionEquality()
                .equals(other.widgetName, widgetName) &&
            const DeepCollectionEquality().equals(other.storyName, storyName) &&
            const DeepCollectionEquality()
                .equals(other.widgetFilePath, widgetFilePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(widgetName),
      const DeepCollectionEquality().hash(storyName),
      const DeepCollectionEquality().hash(widgetFilePath));

  @JsonKey(ignore: true)
  @override
  _$$_UseCaseDataCopyWith<_$_UseCaseData> get copyWith =>
      __$$_UseCaseDataCopyWithImpl<_$_UseCaseData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UseCaseDataToJson(this);
  }
}

abstract class _UseCaseData implements UseCaseData {
  factory _UseCaseData(
      {required final String widgetName,
      required final String storyName,
      required final String widgetFilePath}) = _$_UseCaseData;

  factory _UseCaseData.fromJson(Map<String, dynamic> json) =
      _$_UseCaseData.fromJson;

  @override
  String get widgetName => throw _privateConstructorUsedError;
  @override
  String get storyName => throw _privateConstructorUsedError;
  @override
  String get widgetFilePath => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UseCaseDataCopyWith<_$_UseCaseData> get copyWith =>
      throw _privateConstructorUsedError;
}
