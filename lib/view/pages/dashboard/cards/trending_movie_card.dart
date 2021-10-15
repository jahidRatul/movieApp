import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class TrendingMovieWidget extends StatelessWidget {
  final Function onTap;
  final String imgPath;
  final int movieIndex;

  TrendingMovieWidget({
    this.onTap,
    this.imgPath,
    this.movieIndex,
  });

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              width: wp(29),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                  image: PCacheImage(
                    imgPath != null
                        ? AppUrls.imageBaseUrl + imgPath
                        : 'images/hellboy.JPG',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    color: AppColors.ShadowRed,
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Container(
                  child: Center(
                    child: Text(
                      '$movieIndex'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
