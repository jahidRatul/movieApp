import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class GenreCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  GenreCard({this.imageUrl, this.name});

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;

    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Stack(
        children: [
          Container(
            // width: wp(29),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: AppColors.yellowColor, width: 2),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.srcOver),
                image: PCacheImage(
                  AppUrls.imageBaseUrl + "$imageUrl",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Text(
              name ?? '',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
