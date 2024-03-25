import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tha_maps/theme/text_style_theme.dart';

import '../../helper/size_helper.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.url,
    required this.distance,
    required this.name,
    required this.onTap,
  });
  final String url;
  final String distance;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 20, bottom: 20, top: 20),
        padding: EdgeInsets.all(10),
        width: SizeHelper.width(context) * 80 / 100,
        height: SizeHelper.height(context) * 45 / 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: CachedNetworkImageProvider(url),
              fit: BoxFit.cover,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: TextStyleTheme.textImage,
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              child: Text(
                distance,
                style: TextStyleTheme.textImage,
              ),
              alignment: Alignment.centerRight,
            ),
          ],
        ),
      ),
    );
  }
}
