import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tha_maps/data/model/category_model.dart';
import 'package:tha_maps/domain/controller/wisata_controller.dart';

import '../../../../helper/token_helper.dart';

part 'category_state.dart';
part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState.initial());
  final TokenHelper _tokenHelper = TokenHelper();
  late String token;
  final WisataController _wisataController = WisataController();
  late CategoryModel categoryModel;

  initial() async {
    emit(CategoryState.loading());
    token = await _tokenHelper.getToken();
    var request = await _wisataController.getCategory(token);
    print(request.statusCode);
    if (request.statusCode == 200) {
      categoryModel = CategoryModel.fromJson(request.data);
      emit(CategoryState.loaded(categoryModel));
    } else if (request.statusCode == 401) {
      emit(CategoryState.unautorize());
    } else {
      emit(CategoryState.error(request.message));
    }
  }
}
