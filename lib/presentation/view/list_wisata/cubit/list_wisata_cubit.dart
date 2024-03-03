import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tha_maps/data/api/response_model.dart';

import '../../../../data/model/wisata_model.dart';
import '../../../../domain/controller/wisata_controller.dart';
import '../../../../helper/token_helper.dart';

part 'list_wisata_state.dart';
part 'list_wisata_cubit.freezed.dart';

class ListWisataCubit extends Cubit<ListWisataState> {
  ListWisataCubit() : super(ListWisataState.initial());
  final TokenHelper _tokenHelper = TokenHelper();
  final WisataController _wisataController = WisataController();
  var token;
  late WisataModel wisataModel;
  late ResponseModel request;
  late Position position;

  initial(String id) async {
    emit(ListWisataState.loading());
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    token = await _tokenHelper.getToken();
    if (id == 'all') {
      request = await _wisataController.getWisata(token);
    } else {
      request = await _wisataController.getWisatabyCategory(token, id);
    }

    print(token);
    if (request.statusCode == 200) {
      wisataModel = WisataModel.fromJson(request.data);
      emit(ListWisataState.loaded(wisataModel, position));
    } else if (request.statusCode == 401) {
      emit(ListWisataState.unautorize());
    } else {
      emit(ListWisataState.error(request.message));
    }
  }
}
