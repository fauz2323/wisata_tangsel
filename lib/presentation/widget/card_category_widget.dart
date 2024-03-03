import 'package:flutter/material.dart';

import '../../helper/size_helper.dart';
import '../../theme/box_shadow_theme.dart';
import '../../theme/text_style_theme.dart';

class CardCategoryWidget extends StatelessWidget {
  const CardCategoryWidget({
    super.key,
    required this.tittle,
    required this.onTap,
  });
  final String tittle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: SizeHelper.width(context) * 90 / 100,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadowTheme.cardShadow,
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(
              'assets/images/nature.png',
              width: 50,
              height: 50,
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              tittle,
              style: TextStyleTheme.appbarText,
            ),
            Spacer(),
            Icon(Icons.arrow_right)
          ],
        ),
      ),
    );
  }
}
