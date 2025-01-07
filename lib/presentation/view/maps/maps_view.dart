import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tha_maps/data/freezed_model/maps_freezed_model.dart';
import 'package:tha_maps/presentation/view/maps/cubit/maps_cubit.dart';

import '../../../helper/token_helper.dart';
import '../../widget/loading_widget.dart';

class MapsView extends StatelessWidget {
  const MapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapsCubit()..initial(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps Screen"),
      ),
      body: BlocConsumer<MapsCubit, MapsState>(
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
            loaded: (data) => _page(context, data),
            loading: () => LoadingWidget(),
          );
        },
      ),
    );
  }

  Widget _page(BuildContext context, MapsFreezedModel data) {
    return FlutterMap(
      mapController: data.mapController,
      options: MapOptions(
        initialCenter: LatLng(-6.629772405404552, 106.64840107191725),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          // Plenty of other options available!
        ),
        MarkerLayer(
          markers: data.wisataModel.wisata
              .map(
                (e) => Marker(
                  point: LatLng(e.latitude, e.longitude),
                  width: 80,
                  height: 80,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.location_on),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
