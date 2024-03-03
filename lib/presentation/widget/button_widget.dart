import 'package:flutter/material.dart';

import '../../theme/color_theme.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
  });
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ColorTheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Center(
            child: Text(
              text,
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
