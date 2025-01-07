import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tha_maps/data/model/wisata_argument_model.dart';
import 'package:tha_maps/data/model/wisata_model.dart';
import 'package:tha_maps/helper/distance_helper.dart';
import 'package:tha_maps/presentation/view/list_wisata/cubit/list_wisata_cubit.dart';
import 'package:tha_maps/presentation/widget/menu_wisata_widget.dart';

import '../../../helper/token_helper.dart';
import '../../../theme/text_style_theme.dart';
import '../../widget/loading_widget.dart';

class ListWisataView extends StatelessWidget {
  const ListWisataView({super.key});

  @override
  Widget build(BuildContext context) {
    var argument =
        ModalRoute.of(context)?.settings.arguments as WisataArgumentModel;
    return BlocProvider(
      create: (context) => ListWisataCubit()..initial(argument.id),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Wisata", style: TextStyleTheme.appbarText),
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<ListWisataCubit, ListWisataState>(
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
            loading: () => const LoadingWidget(),
            loaded: (data, position) => _page(context, data, position),
          );
        },
      ),
    );
  }

  Widget _page(
      BuildContext context, WisataModel wisataModel, Position position) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
            children: wisataModel.wisata
                .map(
                  (e) => MenuWisataWidget(
                    onTap: () {
                      Navigator.pushNamed(context, '/detail-wisata',
                          arguments: WisataArgumentModel(id: e.id.toString()));
                    },
                    tittle: e.nama,
                    url:
                        "https://pesonakabupaten.site/storage/image/${e.image.image}",
                    distance: DistanceHelper()
                        .getDistance(
                          position.latitude,
                          position.longitude,
                          e.latitude,
                          e.longitude,
                        )
                        .toStringAsFixed(2),
                  ),
                )
                .toList()),
      ),
    );
  }
}
