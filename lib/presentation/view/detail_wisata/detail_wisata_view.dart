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
      appBar: AppBar(
        title: Text("Detail Wisata"),
      ),
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
            return SafeArea(
              child: SingleChildScrollView(
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
              ),
            );
          },
        );
      } catch (e) {
        print(e);
      }
    }

    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              CachedNetworkImage(
                imageUrl: "https://zeen.my.id/storage/image/" +
                    state.detail.image.image,
                width: SizeHelper.width(context),
                fit: BoxFit.cover,
                placeholder: (context, url) => const LoadingWidget(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.detail.nama,
                      style: TextStyleTheme.primary,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(state.detail.alamat),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Jam Operasional : " + state.detail.operatingHours),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Cari Penginapan"),
                      ),
                    ),
                    Text("Detail: "),
                    SizedBox(
                      height: 10,
                      child: Divider(),
                    ),
                    Text(state.detail.deskripsi),
                    SizedBox(
                      height: 10,
                      child: Divider(),
                    ),
                    Text("Nomor Pengelola : " + state.detail.info.phone),
                    Text("Distance : " +
                        DistanceHelper()
                            .getDistance(
                              double.parse(state.detail.latitude),
                              double.parse(state.detail.longitude),
                              position.latitude,
                              position.longitude,
                            )
                            .toStringAsFixed(2) +
                        " KM"),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: ButtonWidget(
            onTap: () {
              openMapsSheet(context);
            },
            text: "Open Maps",
            width: SizeHelper.width(context) * 90 / 100,
            height: 50,
          ),
        )
      ],
    );
  }
}
