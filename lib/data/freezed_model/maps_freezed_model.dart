// This file is "main.dart"
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import 'package:tha_maps/data/model/wisata_model.dart';

part 'maps_freezed_model.freezed.dart';

@freezed
class MapsFreezedModel with _$MapsFreezedModel {
  const factory MapsFreezedModel({
    required String tittle,
    required LatLng latLng,
    required MapController mapController,
    required MapOptions mapOptions,
    required WisataModel wisataModel,
  }) = _MapsFreezedModel;
}
