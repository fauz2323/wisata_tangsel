import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tha_maps/presentation/view/login/cubit/login_cubit.dart';
import 'package:tha_maps/presentation/widget/loading_widget.dart';

import '../../../helper/size_helper.dart';
import '../../../theme/text_style_theme.dart';
import '../../widget/button_widget.dart';
import '../../widget/form_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) => _build(context)),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              loaded: () {
                Navigator.pushReplacementNamed(context, '/home');
              });
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            loading: () => LoadingWidget(),
            initial: () => _page(context),
          );
        },
      ),
    );
  }

  Widget _page(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
            ),
            child: Image.asset(
              'assets/images/login.jpg',
              fit: BoxFit.cover,
              height: SizeHelper.height(context) * 0.45,
              width: SizeHelper.width(context),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyleTheme.primary,
                ),
                Text(
                  "Please login to your account",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                FormWidget(
                  controller: usernameController,
                  hintText: "Enter your username",
                  isSecure: false,
                ),
                FormWidget(
                  controller: passwordController,
                  hintText: "Enter your Password",
                  isSecure: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                    ),
                  ),
                ),
                ButtonWidget(
                  onTap: () async {
                    var message = await context.read<LoginCubit>().login(
                        usernameController.text, passwordController.text);

                    //snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                  },
                  text: "Login",
                  width: SizeHelper.width(context) * 90 / 100,
                  height: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.montserrat(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.montserrat(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
