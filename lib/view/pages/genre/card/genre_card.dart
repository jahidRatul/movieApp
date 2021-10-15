import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/constant/country_name.dart';
import 'package:iotflixcinema/core/view_models/theme_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';
import 'package:shape_of_view/shape_of_view.dart';

class GenrePageCard extends StatelessWidget {
  GenrePageCard({this.imagePath, this.name, this.onTap});

  final String imagePath;
  final String name;
  final Function onTap;

  // String getName() {
  //   try {
  //     return imagePath?.split('/')?.last?.split('.')?.first;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ShapeOfView(
        shape: RoundRectShape(
          borderRadius: BorderRadius.circular(10),
          borderColor: AppColors.appAmber,
          borderWidth: 2,
        ),
        elevation: 0,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  // image: AssetImage(this.imagePath ?? CountryNames.bangladesh),
                  image: PCacheImage(imagePath ?? CountryNames.bangladesh),
                  fit: BoxFit.cover,
                )),
            child: GetBuilder<ThemeController>(
              builder: (controller) => Container(
                color: controller.themeMode.index == 2
                    ? Colors.black.withOpacity(0.8)
                    : Colors.white.withOpacity(0.8),
                child: Center(
                  child: Text(
                    // name ?? getName() ?? "",
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline1.color,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
