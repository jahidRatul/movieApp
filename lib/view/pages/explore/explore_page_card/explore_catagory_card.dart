import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/icons/explore_icons_icons.dart';

class ExploreCategoryCard extends StatelessWidget {
  String text;
  String imagePath;
  IconData iconData;
  Color backgroundColor;
  Function onTap;

  ExploreCategoryCard({
    this.text,
    this.iconData,
    this.backgroundColor,
    this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Container(
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: onTap,
        child: Container(
          height: wp(33),
          width: wp(33),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage(
                  imagePath ?? "assets/images/explore_page/actor.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: backgroundColor?.withOpacity(0.8) ??
                  AppColors.devideColor.withOpacity(0.8),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconData ?? ExploreIcons.actor,
                    color: Theme.of(context).textTheme.headline1.color,
                    size: 40,
                  ),
                  Text(
                    text ?? "",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline1.color,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
