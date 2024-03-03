import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tha_maps/domain/controller/auth_controller.dart';
import 'package:tha_maps/helper/token_helper.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial('-'));
  final TokenHelper _tokenHelper = TokenHelper();
  final AuthController _authController = AuthController();
  String version = '-';

  initial() async {
    String token = await _tokenHelper.getToken();
    var request = await _authController.version();
    emit(SplashState.initial(request.data['version']));
    await Future.delayed(const Duration(seconds: 2));
    if (token == '-') {
      emit(SplashState.loaded(false));
    } else {
      emit(SplashState.loaded(true));
    }
  }
}
