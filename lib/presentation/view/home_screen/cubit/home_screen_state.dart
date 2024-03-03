part of 'home_screen_cubit.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState.initial() = _Initial;
  const factory HomeScreenState.loading() = _Loading;
  const factory HomeScreenState.loaded(
      WisataModel wisataModel, Position position) = _Loaded;
  const factory HomeScreenState.error(String message) = _Error;
  const factory HomeScreenState.unautorize() = _Unautorize;
}
