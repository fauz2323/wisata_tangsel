import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tha_maps/domain/controller/auth_controller.dart';
import 'package:tha_maps/helper/token_helper.dart';

import '../../../../data/model/auth_model.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());
  late AuthModel _authModel;
  final AuthController _authController = AuthController();
  final TokenHelper _tokenHelper = TokenHelper();
  var token;

  initial() async {
    emit(ProfileState.loading());
    token = await _tokenHelper.getToken();
    var request = await _authController.auth(token);
    if (request.statusCode == 200) {
      _authModel = AuthModel.fromJson(request.data);
      emit(ProfileState.loaded(_authModel));
    } else if (request.statusCode == 401) {
      emit(ProfileState.unautorize());
    } else {
      emit(ProfileState.error(request.message));
    }
  }
}
