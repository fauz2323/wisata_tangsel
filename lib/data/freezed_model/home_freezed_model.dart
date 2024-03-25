import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';

import '../model/category_model.dart';
import '../model/wisata_model.dart';

part 'home_freezed_model.freezed.dart';

@freezed
class HomeFreezedModel with _$HomeFreezedModel {
  const factory HomeFreezedModel({
    required WisataModel wisataModel,
    required Position position,
    required Address address,
    required CategoryModel category,
    @Default('0') String id,
  }) = _HomeFreezedModel;
}
