import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tha_maps/data/model/category_model.dart';
import 'package:tha_maps/presentation/view/category/cubit/category_cubit.dart';
import 'package:tha_maps/presentation/widget/card_category_widget.dart';

import '../../../data/model/wisata_argument_model.dart';
import '../../../helper/token_helper.dart';
import '../../../theme/text_style_theme.dart';
import '../../widget/loading_widget.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..initial(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Apps", style: TextStyleTheme.appbarText),
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            unautorize: () async {
              await TokenHelper().deleteAllToken();
              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, '/login');
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            loading: () => LoadingWidget(),
            loaded: (data) => _loaded(context, data),
          );
        },
      ),
    );
  }

  Widget _loaded(BuildContext context, CategoryModel data) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: data.category
              .map((e) => CardCategoryWidget(
                  tittle: e.category,
                  onTap: () {
                    Navigator.pushNamed(context, '/wisata',
                        arguments: WisataArgumentModel(id: e.id.toString()));
                  }))
              .toList(),
        ),
      ),
    );
  }
}
