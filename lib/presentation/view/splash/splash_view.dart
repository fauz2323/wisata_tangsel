import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tha_maps/presentation/view/splash/cubit/splash_cubit.dart';
import 'package:tha_maps/theme/color_theme.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..initial(),
      child: Builder(builder: (context) => _build(context)),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.primary,
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          // TODO: implement listener
          state.maybeWhen(
            orElse: () {},
            loaded: (isLogin) async {
              if (isLogin) {
                Navigator.pushReplacementNamed(context, '/home');
              } else {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            initial: (version) => _loaded(context, version),
          );
        },
      ),
    );
  }

  Widget _loaded(BuildContext context, String version) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Spacer(),
            Image.asset('assets/images/logo.png', width: 200, height: 200),
            Spacer(),
            Text(
              "Version $version",
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
