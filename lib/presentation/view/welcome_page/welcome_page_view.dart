import 'package:flutter/material.dart';
import 'package:tha_maps/theme/text_style_theme.dart';

import '../../../helper/size_helper.dart';
import '../../widget/button_widget.dart';

class WelcomePageView extends StatelessWidget {
  const WelcomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg-welcome2.jpg',
            fit: BoxFit.cover,
            height: SizeHelper.height(context),
          ),
          SafeArea(
              child: Column(
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.all(20),
                width: SizeHelper.width(context),
                height: SizeHelper.height(context) * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Explore Beautiful of Tangsel in Indonesia",
                      style: TextStyleTheme.textWelcome,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your Trips will be Memorable in Your Hand.",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    ButtonWidget(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      text: "Get Started",
                      width: SizeHelper.width(context) * 90 / 100,
                      height: 50,
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
