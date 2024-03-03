import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/controller/auth_controller.dart';
import '../../../../helper/token_helper.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());
  final TokenHelper _tokenHelper = TokenHelper();
  final AuthController _authController = AuthController();

  register(String username, String name, String email, String password,
      String confirm_password) async {
    if (password != confirm_password) {
      return 'Password not match';
    }

    emit(RegisterState.loading());
    var request =
        await _authController.register(username, name, email, password);
    if (request.statusCode == 200) {
      _tokenHelper.setToken(request.data['token']);
      emit(RegisterState.loaded());
      return request.message;
    } else {
      emit(RegisterState.initial());
      return request.message;
    }
  }
}
