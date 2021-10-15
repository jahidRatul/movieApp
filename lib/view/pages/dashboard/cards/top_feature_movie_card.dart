import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';

class TopFeatureMovieCard extends StatelessWidget {
  final String imgPath;
  final Function onTap;

  TopFeatureMovieCard({
    this.imgPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;

    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              width: wp(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                  image: AssetImage(
                    imgPath ?? 'images/jokerWide.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: AppColors.ShadowRed,
            //         borderRadius: BorderRadius.all(Radius.circular(3))),
            //     child: Container(
            //       margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
            //       child: Text(
            //         'Featured'.toUpperCase(),
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 6,
            //             fontWeight: FontWeight.w300),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
