import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class TopResultImgCard extends StatelessWidget {
  final String imageUrl;

  TopResultImgCard(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;

    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Container(
        // width: wp(29),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
            image: PCacheImage(
            AppUrls.imageBaseUrl+"$imageUrl",
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
