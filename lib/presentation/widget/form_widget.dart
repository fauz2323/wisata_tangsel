import 'package:flutter/material.dart';

import '../../theme/color_theme.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.controller,
    required this.isSecure,
    required this.hintText,
  });

  final TextEditingController controller;
  final bool isSecure;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: isSecure,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.grey,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: ColorTheme.primary,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.red,
              )),
        ),
      ),
    );
  }
}
