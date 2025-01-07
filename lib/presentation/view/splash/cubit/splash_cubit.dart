import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tha_maps/domain/controller/auth_controller.dart';
import 'package:tha_maps/helper/token_helper.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial('-'));
  final TokenHelper _tokenHelper = TokenHelper();
  final AuthController _authController = AuthController();
  String version = '-';

  initial() async {
    String token = await _tokenHelper.getToken();
    emit(const SplashState.initial("1.0.0"));
    await Future.delayed(const Duration(seconds: 2));
    if (token == '-') {
      emit(const SplashState.loaded(false));
    } else {
      emit(const SplashState.loaded(true));
    }
  }
}
