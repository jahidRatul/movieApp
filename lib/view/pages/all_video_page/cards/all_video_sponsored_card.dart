import 'package:flutter/material.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';

class AllVideoSponsoredCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.white.withOpacity(.1),
                  blurRadius: 10,
                  spreadRadius: 0.5,
                  offset: Offset(0, 0),
                )
              ],
              image: DecorationImage(
                image: AssetImage(
                  'images/sponcoredMovie.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.deepRed,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(3),
                  bottomRight: Radius.circular(3),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                child: Text(
                  'Sponsored',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 6,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(
                  'A Brand New\n Season\n Coming Soon',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
