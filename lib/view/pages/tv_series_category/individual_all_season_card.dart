import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class IndividualAllSeasonCard extends StatelessWidget {
  final String title;
  final String img;
  final Function onTap;

  IndividualAllSeasonCard({this.title, this.img, this.onTap});

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(03),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0, 2),
                  spreadRadius: 2,
                  blurRadius: 2)
            ]),
        child: Column(
          children: [
            Container(
              width: wp(50),
              height: wp(50) * (6 / 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(3),
                  topLeft: Radius.circular(3),
                ),
                image: DecorationImage(
                  image: PCacheImage(
                    img,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                width: wp(50),
                alignment: Alignment.center,
                child: Text(
                  title,
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
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
