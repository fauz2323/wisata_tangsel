import 'package:flutter/material.dart';
import 'package:tha_maps/presentation/view/category/category_view.dart';
import 'package:tha_maps/presentation/view/detail_wisata/detail_wisata_view.dart';
import 'package:tha_maps/presentation/view/home/home_view.dart';
import 'package:tha_maps/presentation/view/list_wisata/list_wisata_view.dart';
import 'package:tha_maps/presentation/view/login/login_view.dart';
import 'package:tha_maps/presentation/view/register/register_view.dart';

import '../presentation/view/maps/maps_view.dart';
import '../presentation/view/splash/splash_view.dart';

class RouteHelper {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => SplashView(),
    '/login': (context) => LoginView(),
    '/register': (context) => const RegisterView(),
    '/home': (context) => const HomeView(),
    '/wisata': (context) => const ListWisataView(),
    '/kategori': (context) => const CategoryView(),
    '/maps': (context) => const MapsView(),
    '/detail-wisata': (context) => const DetailWisataView(),
  };
}
