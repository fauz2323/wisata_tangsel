part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(int selected) = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded(int selected) = _Loaded;
  const factory HomeState.error(String message) = _Error;
}
