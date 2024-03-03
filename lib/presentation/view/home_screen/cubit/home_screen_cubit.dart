import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tha_maps/data/model/wisata_model.dart';
import 'package:tha_maps/domain/controller/wisata_controller.dart';
import 'package:tha_maps/helper/token_helper.dart';
import 'package:geolocator/geolocator.dart';

part 'home_screen_state.dart';
part 'home_screen_cubit.freezed.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenState.initial());
  final TokenHelper _tokenHelper = TokenHelper();
  final WisataController _wisataController = WisataController();
  var token;
  late WisataModel wisataModel;
  late Position position;

  initial() async {
    emit(HomeScreenState.loading());
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    token = await _tokenHelper.getToken();
    print(token);
    var request = await _wisataController.getWisata(token);
    if (request.statusCode == 200) {
      wisataModel = WisataModel.fromJson(request.data);
      emit(HomeScreenState.loaded(wisataModel, position));
    } else if (request.statusCode == 401) {
      emit(HomeScreenState.unautorize());
    } else {
      emit(HomeScreenState.error(request.message));
    }
  }
}
