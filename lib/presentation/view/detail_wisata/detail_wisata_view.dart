import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:tha_maps/data/model/detail_wisata_model.dart';
import 'package:tha_maps/helper/distance_helper.dart';
import 'package:tha_maps/helper/size_helper.dart';
import 'package:tha_maps/presentation/view/detail_wisata/cubit/detail_wisata_cubit.dart';
import 'package:tha_maps/presentation/widget/loading_widget.dart';
import 'package:tha_maps/theme/color_theme.dart';
import 'package:tha_maps/theme/text_style_theme.dart';

import '../../../data/model/wisata_argument_model.dart';
import '../../../helper/token_helper.dart';
import '../../widget/button_widget.dart';

class DetailWisataView extends StatelessWidget {
  const DetailWisataView({super.key});

  @override
  Widget build(BuildContext context) {
    var argument =
        ModalRoute.of(context)?.settings.arguments as WisataArgumentModel;
    return BlocProvider(
      create: (context) => DetailWisataCubit()..initial(argument.id),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DetailWisataCubit, DetailWisataState>(
        listener: (context, state) {
          // TODO: implement listener
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
            orElse: () => const Placeholder(),
            loaded: (data, position) => _loaded(context, data, position),
            loading: () => LoadingWidget(),
            error: (message) => ErrorWidget(message),
          );
        },
      ),
    );
  }

  Widget _loaded(
      BuildContext context, DetailWisataModel state, Position position) {
    openMapsSheet(context) async {
      try {
        final coords = Coords(double.parse(state.detail.latitude),
            double.parse(state.detail.longitude));
        final title = state.detail.nama;
        final availableMaps = await MapLauncher.installedMaps;

        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      } catch (e) {
        print(e);
      }
    }

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          child: CachedNetworkImage(
            imageUrl:
                "https://zeen.my.id/storage/image/" + state.detail.image.image,
            width: SizeHelper.width(context),
            height: SizeHelper.height(context) * 0.35,
            fit: BoxFit.cover,
            placeholder: (context, url) => const LoadingWidget(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorTheme.tertiary.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.white,
                        width: 0.5,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.arrow_back_ios_rounded),
                  ),
                ),
                SizedBox(
                  height: SizeHelper.height(context) * 0.36 -
                      MediaQuery.of(context).padding.top -
                      AppBar().preferredSize.height,
                ),
                Container(
                  child: DefaultTabController(
                    initialIndex: 0,
                    length: 2,
                    child: Expanded(
                      child: Column(
                        children: [
                          TabBar(
                            labelColor: ColorTheme.primary,
                            unselectedLabelColor: Colors.black.withOpacity(0.5),
                            tabs: [
                              Tab(
                                child: Text(
                                  'Detail',
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Image',
                                ),
                              ),
                            ],
                            indicator: BoxDecoration(),
                          ),
                          Expanded(
                            child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                _detail(context, state, position),
                                Text('data2'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ButtonWidget(
                      width: SizeHelper.width(context),
                      height: 42,
                      text: "Open Maps",
                      onTap: () {
                        openMapsSheet(context);
                      }),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _detail(
      BuildContext context, DetailWisataModel state, Position position) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            state.detail.nama,
            style: TextStyleTheme.h1,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            state.detail.alamat,
            style: TextStyleTheme.alamatText,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Distance " +
                DistanceHelper()
                    .getDistance(
                        position.latitude,
                        position.longitude,
                        double.parse(state.detail.latitude),
                        double.parse(state.detail.longitude))
                    .toStringAsFixed(2) +
                " km",
            style: TextStyleTheme.alamatText,
          ),
          Divider(),
          Text(
            "Description",
            style: TextStyleTheme.appbarText,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(state.detail.deskripsi),
          )
        ],
      ),
    );
  }
}
