import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tha_maps/data/model/wisata_argument_model.dart';
import 'package:tha_maps/data/model/wisata_model.dart';
import 'package:tha_maps/helper/distance_helper.dart';
import 'package:tha_maps/helper/size_helper.dart';
import 'package:tha_maps/presentation/view/home_screen/cubit/home_screen_cubit.dart';
import 'package:tha_maps/presentation/widget/button_menu_widget.dart';
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
            loaded: (data, position, address) =>
                _loaded(context, data, position, address),
          );
        },
      ),
    );
  }

  Widget _loaded(BuildContext context, WisataModel data, Position position,
      Address address) {
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
                      Text(address.city ?? 'city not detected',
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
              width: SizeHelper.width(context),
              height: SizeHelper.height(context) * 35 / 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: data.wisata
                    .map(
                      (e) => ImageSlider(
                        onTap: () {
                          Navigator.pushNamed(context, '/detail-wisata',
                              arguments:
                                  WisataArgumentModel(id: e.id.toString()));
                        },
                        url:
                            "https://zeen.my.id/storage/image/" + e.image.image,
                        distance: DistanceHelper()
                                .getDistance(
                                  position.latitude,
                                  position.longitude,
                                  double.parse(e.latitude),
                                  double.parse(e.longitude),
                                )
                                .toStringAsFixed(2) +
                            " KM",
                        name: e.nama,
                      ),
                    )
                    .toList(),
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

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    required this.url,
    required this.distance,
    required this.name,
    required this.onTap,
  });
  final String url;
  final String distance;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(5),
        width: SizeHelper.width(context) * 45 / 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0.5,
                blurRadius: 2,
                offset: Offset(0, 3),
              )
            ]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: url,
                height: SizeHelper.width(context) * 45 / 100 - 10,
                width: SizeHelper.width(context) * 45 / 100 - 10,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    child: Text(distance),
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
