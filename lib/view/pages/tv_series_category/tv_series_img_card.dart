import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class TVSeriesImgCard extends StatelessWidget {
  final Function onTap;
  final String imgPath;

  TVSeriesImgCard({
    this.onTap,
    this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;

    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: InkWell(
        onTap: onTap,
        child: Container(
          // width: wp(29),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            image: DecorationImage(
              image: PCacheImage(
                imgPath ?? 'images/tvSeriesImg.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
