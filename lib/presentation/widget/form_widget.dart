import 'package:flutter/material.dart';

import '../../theme/color_theme.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.controller,
    required this.isSecure,
    required this.hintText,
    required this.name,
  });

  final TextEditingController controller;
  final bool isSecure;
  final String hintText;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            obscureText: isSecure,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorTheme.primary,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
