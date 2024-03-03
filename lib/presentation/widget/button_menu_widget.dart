import 'package:flutter/material.dart';

import '../../helper/size_helper.dart';
import '../../theme/color_theme.dart';

class ButtonMenu extends StatelessWidget {
  const ButtonMenu({
    super.key,
    required this.tittle,
    required this.path,
    required this.onTap,
  });
  final String tittle;
  final String path;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: SizeHelper.width(context) * 12 / 100,
            height: SizeHelper.width(context) * 12 / 100,
            decoration: BoxDecoration(
              color: ColorTheme.secondary.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(path),
                ),
              ),
            ),
          ),
          Text(tittle)
        ],
      ),
    );
  }
}
