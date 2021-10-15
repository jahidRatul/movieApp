import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class RandomMovieCard extends StatelessWidget {
  final String imgPath;

  RandomMovieCard({
    this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        width: wp(90),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          image: DecorationImage(
            image: PCacheImage(imgPath),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
