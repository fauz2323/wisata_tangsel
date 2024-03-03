part of 'detail_wisata_cubit.dart';

@freezed
class DetailWisataState with _$DetailWisataState {
  const factory DetailWisataState.initial() = _Initial;
  const factory DetailWisataState.loading() = _Loading;
  const factory DetailWisataState.loaded(
      DetailWisataModel data, Position position) = _Loaded;
  const factory DetailWisataState.error(String message) = _Error;
  const factory DetailWisataState.unautorize() = _Unautorize;
}
