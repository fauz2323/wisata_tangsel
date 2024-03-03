import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tha_maps/theme/box_shadow_theme.dart';

import '../../helper/size_helper.dart';
import '../../theme/text_style_theme.dart';

class MenuWisataWidget extends StatelessWidget {
  const MenuWisataWidget({
    super.key,
    required this.tittle,
    required this.onTap,
    required this.url,
    required this.distance,
  });
  final String tittle;
  final VoidCallback onTap;
  final String url;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadowTheme.cardShadow,
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                width: SizeHelper.width(context) * 90 / 100,
                height: SizeHelper.height(context) * 25 / 100,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                tittle,
                style: TextStyleTheme.appbarText,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: Text("Distance : " + distance + " Km"),
            )
          ],
        ),
      ),
    );
  }
}
