import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tha_maps/helper/route_helper.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Trip',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: RouteHelper.routes,
    );
  }
}
