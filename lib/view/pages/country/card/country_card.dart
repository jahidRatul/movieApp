import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iotflixcinema/core/view_models/theme_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';
import 'package:shape_of_view/shape_of_view.dart';

class CountryCard extends StatelessWidget {
  CountryCard({
    this.countryFlagPath,
    this.countryName,
    this.onTap,
  });

  final String countryFlagPath;
  final String countryName;
  final Function onTap;

  // String getName() {
  //   try {
  //     return countryFlagPath?.split('/')?.last?.split('.')?.first;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: ShapeOfView(
          shape: RoundRectShape(
            borderRadius: BorderRadius.circular(10),
            borderColor: AppColors.appAmber,
            borderWidth: 2,
          ),
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
                // color: Colors.black,
                image: DecorationImage(
              image:
                  // AssetImage(this.countryFlagPath ?? CountryNames.bangladesh),
                  PCacheImage(countryFlagPath),
              fit: BoxFit.cover,
            )),
            child: GetBuilder<ThemeController>(
              builder: (controller) => Container(
                color: controller.themeMode.index == 2
                    ? Colors.black.withOpacity(0.7)
                    : Colors.white.withOpacity(0.7),
                child: Center(
                  child: Text(
                    countryName,
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
