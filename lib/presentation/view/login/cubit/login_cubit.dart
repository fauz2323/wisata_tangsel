import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tha_maps/domain/controller/auth_controller.dart';
import 'package:tha_maps/helper/token_helper.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());
  final TokenHelper _tokenHelper = TokenHelper();
  final AuthController _authController = AuthController();

  login(String username, String password) async {
    emit(LoginState.loading());
    var request = await _authController.login(username, password);
    if (request.statusCode == 200) {
      _tokenHelper.setToken(request.data['token']);
      emit(LoginState.loaded());
      return request.message;
    } else {
      emit(LoginState.initial());
      return request.message;
    }
  }
}
