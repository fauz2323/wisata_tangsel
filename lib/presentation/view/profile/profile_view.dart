import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tha_maps/data/model/auth_model.dart';
import 'package:tha_maps/helper/token_helper.dart';
import 'package:tha_maps/presentation/view/profile/cubit/profile_cubit.dart';
import 'package:tha_maps/presentation/widget/loading_widget.dart';
import 'package:tha_maps/theme/box_shadow_theme.dart';
import 'package:tha_maps/theme/text_style_theme.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..initial(),
      child: Builder(builder: (context) {
        return _build(context);
      }),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyleTheme.appbarText,
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
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
            orElse: () => Container(),
            loading: () => LoadingWidget(),
            loaded: (data) => _page(context, data),
          );
        },
      ),
    );
  }

  Widget _page(BuildContext context, AuthModel data) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadowTheme.cardShadow,
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/profile.png',
                  width: 80,
                  height: 80,
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.user.nama,
                        style: TextStyleTheme.appbarText,
                      ),
                      Text(data.user.email)
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Menu",
            style: TextStyleTheme.appbarText,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadowTheme.cardShadow,
              ],
            ),
            child: Column(
              children: [
                MenuProfileWidget(
                  title: "Change Password",
                  onTap: () {},
                ),
                Divider(),
                MenuProfileWidget(
                  title: "Favorite Trip",
                  onTap: () {},
                ),
                Divider(),
                MenuProfileWidget(
                  title: "Log Out",
                  onTap: () {},
                ),
                Divider(),
                MenuProfileWidget(
                  title: "About This Apps",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuProfileWidget extends StatelessWidget {
  const MenuProfileWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
            ),
            Icon(
              Icons.arrow_forward_ios,
            )
          ],
        ),
      ),
    );
  }
}
