// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_freezed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeFreezedModel {
  WisataModel get wisataModel => throw _privateConstructorUsedError;
  Position get position => throw _privateConstructorUsedError;
  Address get address => throw _privateConstructorUsedError;
  CategoryModel get category => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeFreezedModelCopyWith<HomeFreezedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeFreezedModelCopyWith<$Res> {
  factory $HomeFreezedModelCopyWith(
          HomeFreezedModel value, $Res Function(HomeFreezedModel) then) =
      _$HomeFreezedModelCopyWithImpl<$Res, HomeFreezedModel>;
  @useResult
  $Res call(
      {WisataModel wisataModel,
      Position position,
      Address address,
      CategoryModel category,
      String id});
}

/// @nodoc
class _$HomeFreezedModelCopyWithImpl<$Res, $Val extends HomeFreezedModel>
    implements $HomeFreezedModelCopyWith<$Res> {
  _$HomeFreezedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wisataModel = null,
    Object? position = null,
    Object? address = null,
    Object? category = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      wisataModel: null == wisataModel
          ? _value.wisataModel
          : wisataModel // ignore: cast_nullable_to_non_nullable
              as WisataModel,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeFreezedModelImplCopyWith<$Res>
    implements $HomeFreezedModelCopyWith<$Res> {
  factory _$$HomeFreezedModelImplCopyWith(_$HomeFreezedModelImpl value,
          $Res Function(_$HomeFreezedModelImpl) then) =
      __$$HomeFreezedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WisataModel wisataModel,
      Position position,
      Address address,
      CategoryModel category,
      String id});
}

/// @nodoc
class __$$HomeFreezedModelImplCopyWithImpl<$Res>
    extends _$HomeFreezedModelCopyWithImpl<$Res, _$HomeFreezedModelImpl>
    implements _$$HomeFreezedModelImplCopyWith<$Res> {
  __$$HomeFreezedModelImplCopyWithImpl(_$HomeFreezedModelImpl _value,
      $Res Function(_$HomeFreezedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wisataModel = null,
    Object? position = null,
    Object? address = null,
    Object? category = null,
    Object? id = null,
  }) {
    return _then(_$HomeFreezedModelImpl(
      wisataModel: null == wisataModel
          ? _value.wisataModel
          : wisataModel // ignore: cast_nullable_to_non_nullable
              as WisataModel,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeFreezedModelImpl implements _HomeFreezedModel {
  const _$HomeFreezedModelImpl(
      {required this.wisataModel,
      required this.position,
      required this.address,
      required this.category,
      this.id = '0'});

  @override
  final WisataModel wisataModel;
  @override
  final Position position;
  @override
  final Address address;
  @override
  final CategoryModel category;
  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'HomeFreezedModel(wisataModel: $wisataModel, position: $position, address: $address, category: $category, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeFreezedModelImpl &&
            (identical(other.wisataModel, wisataModel) ||
                other.wisataModel == wisataModel) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, wisataModel, position, address, category, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeFreezedModelImplCopyWith<_$HomeFreezedModelImpl> get copyWith =>
      __$$HomeFreezedModelImplCopyWithImpl<_$HomeFreezedModelImpl>(
          this, _$identity);
}

abstract class _HomeFreezedModel implements HomeFreezedModel {
  const factory _HomeFreezedModel(
      {required final WisataModel wisataModel,
      required final Position position,
      required final Address address,
      required final CategoryModel category,
      final String id}) = _$HomeFreezedModelImpl;

  @override
  WisataModel get wisataModel;
  @override
  Position get position;
  @override
  Address get address;
  @override
  CategoryModel get category;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$HomeFreezedModelImplCopyWith<_$HomeFreezedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
