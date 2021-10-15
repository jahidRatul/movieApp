import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class SeasonVideoCard extends StatelessWidget {
  final int index;
  final String title;
  final String imgPath;
  final Function onTap;

  SeasonVideoCard({this.index, this.title, this.onTap, this.imgPath});

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(03),
            border: Border.all(
                color: AppColors.ShadowRed.withOpacity(.1), width: 1),
            boxShadow: [
              BoxShadow(
                  color: AppColors.fillBorderColor.withOpacity(.3),
                  offset: Offset(0, 2),
                  spreadRadius: .5,
                  blurRadius: .5)
            ]),
        child: Column(
          children: [
            Container(
              width: wp(50),
              height: wp(50) * (3 / 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(3),
                  topLeft: Radius.circular(3),
                ),
                image: DecorationImage(
                  image: PCacheImage(
                    imgPath != null
                        ? AppUrls.imageBaseUrl + imgPath
                        : 'https://picsum.photos/90',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                width: wp(50),
                alignment: Alignment.centerLeft,
                child: Text(
                  "$index. $title",
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.headline1.color,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
