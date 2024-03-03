import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tha_maps/data/model/wisata_argument_model.dart';
import 'package:tha_maps/data/model/wisata_model.dart';
import 'package:tha_maps/helper/distance_helper.dart';
import 'package:tha_maps/presentation/view/home_screen/cubit/home_screen_cubit.dart';

import '../../../helper/token_helper.dart';
import '../../../theme/text_style_theme.dart';
import '../../widget/button_menu_widget.dart';
import '../../widget/loading_widget.dart';
import '../../widget/menu_wisata_widget.dart';

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
      appBar: AppBar(
        title: Text("Trip Apps", style: TextStyleTheme.appbarText),
        actions: [
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
            loaded: (data, position) => _loaded(context, data, position),
          );
        },
      ),
    );
  }

  Widget _loaded(BuildContext context, WisataModel data, Position position) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: data.wisata
                  .map((e) => ImageSlider(
                        url:
                            "https://zeen.my.id/storage/image/" + e.image.image,
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 1.9,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: 5),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonMenu(
                    tittle: "Wisata",
                    path: 'assets/images/mountain.png',
                    onTap: () {
                      Navigator.pushNamed(context, '/wisata',
                          arguments: WisataArgumentModel(id: 'all'));
                    }),
                ButtonMenu(
                  path: 'assets/images/building.png',
                  tittle: "Penginapan",
                  onTap: () {
                    Navigator.pushNamed(context, '/maps');
                  },
                ),
                ButtonMenu(
                    path: 'assets/images/options.png',
                    tittle: "Kategori",
                    onTap: () {
                      Navigator.pushNamed(context, '/kategori');
                    }),
                ButtonMenu(
                  path: 'assets/images/map.png',
                  tittle: "Maps",
                  onTap: () {
                    Navigator.pushNamed(context, '/maps');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Featured Places",
              style: TextStyleTheme.appbarText,
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: data.wisata
                  .map(
                    (e) => MenuWisataWidget(
                      onTap: () {},
                      tittle: e.nama,
                      url: "https://zeen.my.id/storage/image/" + e.image.image,
                      distance: DistanceHelper()
                          .getDistance(
                              double.parse(e.latitude),
                              double.parse(e.longitude),
                              position.latitude,
                              position.longitude)
                          .toStringAsFixed(2),
                    ),
                  )
                  .toList()
                  .take(3)
                  .toList(),
            )
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
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
      ),
    );
  }
}
