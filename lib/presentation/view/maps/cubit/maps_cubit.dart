import 'package:bloc/bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:tha_maps/data/freezed_model/maps_freezed_model.dart';
import 'package:tha_maps/data/model/wisata_model.dart';
import 'package:tha_maps/domain/controller/wisata_controller.dart';
import 'package:tha_maps/helper/token_helper.dart';

part 'maps_state.dart';
part 'maps_cubit.freezed.dart';

class MapsCubit extends Cubit<MapsState> {
  MapsCubit() : super(MapsState.initial());
  final TokenHelper _tokenHelper = TokenHelper();
  final WisataController _wisataController = WisataController();
  var token;
  late WisataModel wisataModel;
  late MapsFreezedModel mapsFreezedModel;
  late MapController mapsController;
  late MapOptions _mapOptions;

  initial() async {
    emit(MapsState.loading());
    token = await _tokenHelper.getToken();
    var request = await _wisataController.getWisata(token);
    if (request.statusCode == 200) {
      mapsController = MapController();
      _mapOptions = MapOptions(
        initialCenter: LatLng(-6.629772405404552, 106.64840107191725),
      );
      wisataModel = WisataModel.fromJson(request.data);
      mapsFreezedModel = MapsFreezedModel(
        wisataModel: wisataModel,
        tittle: '-',
        latLng: LatLng(0, 0),
        mapController: mapsController,
        mapOptions: _mapOptions,
      );
      emit(MapsState.loaded(mapsFreezedModel));
    } else if (request.statusCode == 401) {
      emit(MapsState.unautorize());
    } else {
      emit(MapsState.error(request.message));
    }
  }

  zoomIn() {
    mapsFreezedModel = mapsFreezedModel.copyWith(mapOptions: _mapOptions);
  }

  @override
  Future<void> close() {
    // TODO: implement close
    mapsController.dispose();
    return super.close();
  }
}
