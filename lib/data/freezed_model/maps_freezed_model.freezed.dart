// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maps_freezed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapsFreezedModel {
  String get tittle => throw _privateConstructorUsedError;
  LatLng get latLng => throw _privateConstructorUsedError;
  MapController get mapController => throw _privateConstructorUsedError;
  MapOptions get mapOptions => throw _privateConstructorUsedError;
  WisataModel get wisataModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapsFreezedModelCopyWith<MapsFreezedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapsFreezedModelCopyWith<$Res> {
  factory $MapsFreezedModelCopyWith(
          MapsFreezedModel value, $Res Function(MapsFreezedModel) then) =
      _$MapsFreezedModelCopyWithImpl<$Res, MapsFreezedModel>;
  @useResult
  $Res call(
      {String tittle,
      LatLng latLng,
      MapController mapController,
      MapOptions mapOptions,
      WisataModel wisataModel});
}

/// @nodoc
class _$MapsFreezedModelCopyWithImpl<$Res, $Val extends MapsFreezedModel>
    implements $MapsFreezedModelCopyWith<$Res> {
  _$MapsFreezedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tittle = null,
    Object? latLng = null,
    Object? mapController = null,
    Object? mapOptions = null,
    Object? wisataModel = null,
  }) {
    return _then(_value.copyWith(
      tittle: null == tittle
          ? _value.tittle
          : tittle // ignore: cast_nullable_to_non_nullable
              as String,
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
      mapController: null == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as MapController,
      mapOptions: null == mapOptions
          ? _value.mapOptions
          : mapOptions // ignore: cast_nullable_to_non_nullable
              as MapOptions,
      wisataModel: null == wisataModel
          ? _value.wisataModel
          : wisataModel // ignore: cast_nullable_to_non_nullable
              as WisataModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapsFreezedModelImplCopyWith<$Res>
    implements $MapsFreezedModelCopyWith<$Res> {
  factory _$$MapsFreezedModelImplCopyWith(_$MapsFreezedModelImpl value,
          $Res Function(_$MapsFreezedModelImpl) then) =
      __$$MapsFreezedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tittle,
      LatLng latLng,
      MapController mapController,
      MapOptions mapOptions,
      WisataModel wisataModel});
}

/// @nodoc
class __$$MapsFreezedModelImplCopyWithImpl<$Res>
    extends _$MapsFreezedModelCopyWithImpl<$Res, _$MapsFreezedModelImpl>
    implements _$$MapsFreezedModelImplCopyWith<$Res> {
  __$$MapsFreezedModelImplCopyWithImpl(_$MapsFreezedModelImpl _value,
      $Res Function(_$MapsFreezedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tittle = null,
    Object? latLng = null,
    Object? mapController = null,
    Object? mapOptions = null,
    Object? wisataModel = null,
  }) {
    return _then(_$MapsFreezedModelImpl(
      tittle: null == tittle
          ? _value.tittle
          : tittle // ignore: cast_nullable_to_non_nullable
              as String,
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
      mapController: null == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as MapController,
      mapOptions: null == mapOptions
          ? _value.mapOptions
          : mapOptions // ignore: cast_nullable_to_non_nullable
              as MapOptions,
      wisataModel: null == wisataModel
          ? _value.wisataModel
          : wisataModel // ignore: cast_nullable_to_non_nullable
              as WisataModel,
    ));
  }
}

/// @nodoc

class _$MapsFreezedModelImpl
    with DiagnosticableTreeMixin
    implements _MapsFreezedModel {
  const _$MapsFreezedModelImpl(
      {required this.tittle,
      required this.latLng,
      required this.mapController,
      required this.mapOptions,
      required this.wisataModel});

  @override
  final String tittle;
  @override
  final LatLng latLng;
  @override
  final MapController mapController;
  @override
  final MapOptions mapOptions;
  @override
  final WisataModel wisataModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MapsFreezedModel(tittle: $tittle, latLng: $latLng, mapController: $mapController, mapOptions: $mapOptions, wisataModel: $wisataModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MapsFreezedModel'))
      ..add(DiagnosticsProperty('tittle', tittle))
      ..add(DiagnosticsProperty('latLng', latLng))
      ..add(DiagnosticsProperty('mapController', mapController))
      ..add(DiagnosticsProperty('mapOptions', mapOptions))
      ..add(DiagnosticsProperty('wisataModel', wisataModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapsFreezedModelImpl &&
            (identical(other.tittle, tittle) || other.tittle == tittle) &&
            (identical(other.latLng, latLng) || other.latLng == latLng) &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController) &&
            (identical(other.mapOptions, mapOptions) ||
                other.mapOptions == mapOptions) &&
            (identical(other.wisataModel, wisataModel) ||
                other.wisataModel == wisataModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, tittle, latLng, mapController, mapOptions, wisataModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapsFreezedModelImplCopyWith<_$MapsFreezedModelImpl> get copyWith =>
      __$$MapsFreezedModelImplCopyWithImpl<_$MapsFreezedModelImpl>(
          this, _$identity);
}

abstract class _MapsFreezedModel implements MapsFreezedModel {
  const factory _MapsFreezedModel(
      {required final String tittle,
      required final LatLng latLng,
      required final MapController mapController,
      required final MapOptions mapOptions,
      required final WisataModel wisataModel}) = _$MapsFreezedModelImpl;

  @override
  String get tittle;
  @override
  LatLng get latLng;
  @override
  MapController get mapController;
  @override
  MapOptions get mapOptions;
  @override
  WisataModel get wisataModel;
  @override
  @JsonKey(ignore: true)
  _$$MapsFreezedModelImplCopyWith<_$MapsFreezedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
