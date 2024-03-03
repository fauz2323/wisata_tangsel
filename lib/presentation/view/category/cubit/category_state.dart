part of 'category_cubit.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.loading() = _Loading;
  const factory CategoryState.loaded(CategoryModel categoryModel) = _Loaded;
  const factory CategoryState.error(String message) = _Error;
  const factory CategoryState.unautorize() = _Unautorize;
}
