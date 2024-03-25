import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocode/geocode.dart';
import 'package:tha_maps/data/freezed_model/home_freezed_model.dart';
import 'package:tha_maps/data/model/category_model.dart';
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
  GeoCode geoCode = GeoCode();
  late Address address;
  late CategoryModel categoryModel;
  late HomeFreezedModel dataModel;

  initial() async {
    emit(HomeScreenState.loading());
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    token = await _tokenHelper.getToken();
    print(token);
    var request = await _wisataController.getWisata(token);
    var requestCategory = await _wisataController.getCategory(token);
    if (request.statusCode == 200 && requestCategory.statusCode == 200) {
      wisataModel = WisataModel.fromJson(request.data);
      categoryModel = CategoryModel.fromJson(requestCategory.data);

      final Category dataCategory = Category(
        id: 0,
        userId: '-',
        category: 'All',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      categoryModel.category.insert(0, dataCategory);

      address = await geoCode.reverseGeocoding(
          latitude: position.latitude, longitude: position.longitude);

      dataModel = HomeFreezedModel(
          wisataModel: wisataModel,
          position: position,
          address: address,
          category: categoryModel);

      emit(HomeScreenState.loaded(dataModel));
    } else if (request.statusCode == 401) {
      emit(HomeScreenState.unautorize());
    } else {
      emit(HomeScreenState.error(request.message));
    }
  }

  filterWisata(String id) {
    dataModel = dataModel.copyWith(id: id);
    emit(HomeScreenState.loaded(dataModel));
  }
}
