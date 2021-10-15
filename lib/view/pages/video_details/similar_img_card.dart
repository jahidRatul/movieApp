import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class SimilarImgCard extends StatelessWidget {
  final String imgPath;
  final Function onTap;

  SimilarImgCard({this.imgPath, this.onTap});

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;

    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: wp(50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            image: DecorationImage(
              image: PCacheImage(
                imgPath,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
