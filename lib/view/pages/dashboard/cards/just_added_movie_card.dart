import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class JustAddedMovieCard extends StatelessWidget {
  final String imgPath;
  final Function onTap;

  JustAddedMovieCard({
    this.imgPath,
    this.onTap,
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
        child: Container(
          width: wp(29),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(
              image: PCacheImage(
                imgPath != null ? AppUrls.imageBaseUrl + imgPath : '',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
