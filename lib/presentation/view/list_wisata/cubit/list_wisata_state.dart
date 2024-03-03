part of 'list_wisata_cubit.dart';

@freezed
class ListWisataState with _$ListWisataState {
  const factory ListWisataState.initial() = _Initial;
  const factory ListWisataState.loading() = _Loading;
  const factory ListWisataState.loaded(
      WisataModel wisataModel, Position position) = _Loaded;
  const factory ListWisataState.error(String message) = _Error;
  const factory ListWisataState.unautorize() = _Unautorize;
}
