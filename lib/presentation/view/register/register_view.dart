import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tha_maps/helper/size_helper.dart';
import 'package:tha_maps/presentation/view/register/cubit/register_cubit.dart';
import 'package:tha_maps/presentation/widget/button_widget.dart';
import 'package:tha_maps/presentation/widget/form_widget.dart';
import 'package:tha_maps/presentation/widget/loading_widget.dart';

import '../../../theme/text_style_theme.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(builder: (context) {
        return _build(context);
      }),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account", style: TextStyleTheme.appbarText),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          // TODO: implement listener
          state.maybeWhen(
            orElse: () {},
            loaded: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            initial: () => _page(context),
            loading: () => LoadingWidget(),
          );
        },
      ),
    );
  }

  Widget _page(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 0.1,
                      blurRadius: 2,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    FormWidget(
                      controller: usernameController,
                      isSecure: false,
                      hintText: 'Enter your username',
                    ),
                    FormWidget(
                      controller: nameController,
                      isSecure: false,
                      hintText: 'Enter your name',
                    ),
                    FormWidget(
                      controller: emailController,
                      isSecure: false,
                      hintText: 'Enter your email',
                    ),
                    FormWidget(
                      controller: passwordController,
                      isSecure: true,
                      hintText: 'Enter your password',
                    ),
                    FormWidget(
                      controller: passwordConfirmController,
                      isSecure: true,
                      hintText: 'Confirm your password',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonWidget(
                width: SizeHelper.width(context) * 90 / 100,
                height: 42,
                text: "Register",
                onTap: () async {
                  var message = await context.read<RegisterCubit>().register(
                        usernameController.text,
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                        passwordConfirmController.text,
                      );

                  //snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
