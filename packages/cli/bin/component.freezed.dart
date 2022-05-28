// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Component _$ComponentFromJson(Map<String, dynamic> json) {
  return _Component.fromJson(json);
}

/// @nodoc
mixin _$Component {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComponentCopyWith<$Res> {
  factory $ComponentCopyWith(Component value, $Res Function(Component) then) =
      _$ComponentCopyWithImpl<$Res>;
}

/// @nodoc
class _$ComponentCopyWithImpl<$Res> implements $ComponentCopyWith<$Res> {
  _$ComponentCopyWithImpl(this._value, this._then);

  final Component _value;
  // ignore: unused_field
  final $Res Function(Component) _then;
}

/// @nodoc
abstract class _$$_ComponentCopyWith<$Res> {
  factory _$$_ComponentCopyWith(
          _$_Component value, $Res Function(_$_Component) then) =
      __$$_ComponentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ComponentCopyWithImpl<$Res> extends _$ComponentCopyWithImpl<$Res>
    implements _$$_ComponentCopyWith<$Res> {
  __$$_ComponentCopyWithImpl(
      _$_Component _value, $Res Function(_$_Component) _then)
      : super(_value, (v) => _then(v as _$_Component));

  @override
  _$_Component get _value => super._value as _$_Component;
}

/// @nodoc
@JsonSerializable()
class _$_Component implements _Component {
  _$_Component();

  factory _$_Component.fromJson(Map<String, dynamic> json) =>
      _$$_ComponentFromJson(json);

  @override
  String toString() {
    return 'Component()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Component);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_ComponentToJson(this);
  }
}

abstract class _Component implements Component {
  factory _Component() = _$_Component;

  factory _Component.fromJson(Map<String, dynamic> json) =
      _$_Component.fromJson;
}
