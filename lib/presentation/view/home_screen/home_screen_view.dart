import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tha_maps/data/freezed_model/home_freezed_model.dart';
import 'package:tha_maps/data/model/wisata_argument_model.dart';
import 'package:tha_maps/helper/distance_helper.dart';
import 'package:tha_maps/helper/size_helper.dart';
import 'package:tha_maps/presentation/view/home_screen/cubit/home_screen_cubit.dart';
import 'package:tha_maps/presentation/widget/button_menu_widget.dart';
import 'package:tha_maps/presentation/widget/image_widget.dart';
import 'package:tha_maps/theme/color_theme.dart';

import '../../../helper/token_helper.dart';
import '../../../theme/text_style_theme.dart';
import '../../widget/loading_widget.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit()..initial(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeScreenCubit, HomeScreenState>(
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
            loaded: (
              data,
            ) =>
                _loaded(
              context,
              data,
            ),
          );
        },
      ),
    );
  }

  Widget _loaded(
    BuildContext context,
    HomeFreezedModel data,
  ) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 20, left: 20, right: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: ColorTheme.primary,
                      ),
                      Text(data.address.city ?? 'city not detected',
                          style: TextStyleTheme.appbarText),
                    ],
                  ),
                  IconButton(
                    onPressed: () async {
                      await TokenHelper().deleteAllToken();
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    icon: Icon(
                      Icons.logout_outlined,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Text(
                "Explore city",
                style: TextStyleTheme.appbarText,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: SizeHelper.width(context),
              height: SizeHelper.height(context) * 5 / 100,
              child: Center(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: data.category.category
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                context
                                    .read<HomeScreenCubit>()
                                    .filterWisata(e.id.toString());
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorTheme.primary),
                                  color: e.id.toString() == data.id
                                      ? ColorTheme.primary
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  e.category,
                                  style: TextStyle(
                                      color: e.id.toString() == data.id
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: SizeHelper.width(context),
              height: SizeHelper.height(context) * 45 / 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: data.wisataModel.wisata.map((e) {
                  if (data.id == '0' ||
                      data.id == e.wisataCategoryId.toString()) {
                    return ImageWidget(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail-wisata',
                            arguments:
                                WisataArgumentModel(id: e.id.toString()));
                      },
                      url: "https://zeen.my.id/storage/image/" + e.image.image,
                      distance: DistanceHelper()
                              .getDistance(
                                data.position.latitude,
                                data.position.longitude,
                                double.parse(e.latitude),
                                double.parse(e.longitude),
                              )
                              .toStringAsFixed(2) +
                          " KM",
                      name: e.nama,
                    );
                  } else {
                    return Container();
                  }
                }).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Text(
                "Menu",
                style: TextStyleTheme.appbarText,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonMenu(
                      tittle: "Wisata",
                      path: 'assets/images/travel-bag.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/wisata',
                            arguments: WisataArgumentModel(id: 'all'));
                      }),
                  ButtonMenu(
                      tittle: "Penginapan",
                      path: 'assets/images/building.png',
                      onTap: () {}),
                  ButtonMenu(
                      tittle: "Maps",
                      path: 'assets/images/place.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/maps');
                      }),
                  ButtonMenu(
                      tittle: "Info",
                      path: 'assets/images/info.png',
                      onTap: () {})
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Text(
                "Explore Hotels",
                style: TextStyleTheme.appbarText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
