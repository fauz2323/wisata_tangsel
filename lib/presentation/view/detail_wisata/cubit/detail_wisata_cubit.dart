import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tha_maps/data/model/detail_wisata_model.dart';
import 'package:tha_maps/domain/controller/wisata_controller.dart';

import '../../../../helper/token_helper.dart';

part 'detail_wisata_state.dart';
part 'detail_wisata_cubit.freezed.dart';

class DetailWisataCubit extends Cubit<DetailWisataState> {
  DetailWisataCubit() : super(DetailWisataState.initial());
  late DetailWisataModel detailWisataModel;
  final WisataController _wisataController = WisataController();
  late Position position;

  initial(String id) async {
    emit(DetailWisataState.loading());
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var token = await TokenHelper().getToken();
    var request = await _wisataController.getDetailWisata(token, id);
    if (request.statusCode == 200) {
      detailWisataModel = DetailWisataModel.fromJson(request.data);
      emit(DetailWisataState.loaded(detailWisataModel, position));
    } else if (request.statusCode == 401) {
      emit(DetailWisataState.unautorize());
    } else {
      emit(DetailWisataState.error(request.message));
    }
  }
}
