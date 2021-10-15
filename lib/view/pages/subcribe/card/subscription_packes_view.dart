import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/theme_view_model.dart';
import 'package:iotflixcinema/view/constant/app_assets.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/icons/sub_scription_icons_icons.dart';

class SubscriptionType {
  static String basic = "Basic";
  static String standard = "Standard";
  static String premium = "Premium";

  static TextDecoration getVideoQuality(String type) {
    return null;
  }

  static String getVideoQualityText(String type) {
    if (type == basic) return 'Good Video Quality';
    if (type == standard) return 'Better Video Quality';
    if (type == premium) return 'Best Video Quality';
    return null;
  }

  static String price(String type) {
    if (type == basic) return "\$7.99";
    if (type == standard) return "\$9.99";
    if (type == premium) return "\$11.99";
    return null;
  }

  static TextDecoration getResolution(String type) {
    return null;
  }

  static String getResolutionText(String type) {
    if (type == basic) return "Resolution 480p";
    if (type == standard) return "Resolution 1080p";
    if (type == premium) return "Resolution 4K + HDR";
    return null;
  }

  static TextDecoration getUnlimitedVideo(String type) {
    if (type == basic) return TextDecoration.lineThrough;
    return null;
  }

  static TextDecoration getFreeMonth(String type) {
    if (type == basic) return TextDecoration.lineThrough;
    if (type == standard) return TextDecoration.lineThrough;
    return null;
  }

  static String getFreeMonthText(String type) {
    if (type == basic) return "Free Two Months";
    if (type == standard) return "Free Two Months";
    if (type == premium) return "Free Two Months & Ad Free";
    return null;
  }

  static TextDecoration getCancelAnyTime(String type) {
    if (type == basic) return TextDecoration.lineThrough;
    if (type == standard) return TextDecoration.lineThrough;
    return null;
  }
}

class SubScripTonPlanView extends StatelessWidget {
  SubScripTonPlanView(this.subscriptionType);

  final String subscriptionType;

  Widget getPlanData(
    BuildContext context, {
    String text,
    IconData iconData,
    TextDecoration textDecoration,
  }) {
    return Container(
      child: Row(
        children: [
          Icon(
            iconData ?? SubScriptionIcons.dolor,
            color: AppColors.ShadowRed,
            size: 35.0,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              text ?? "",
              maxLines: 2,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: textDecoration != null
                    ? AppColors.borderColor
                    : Theme.of(context).textTheme.headline1.color,
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
                decoration: textDecoration,
                decorationStyle: TextDecorationStyle.solid,
                decorationThickness: 1.5,
                decorationColor: AppColors.ShadowRed,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return GetBuilder<ThemeController>(
      builder: (controller) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: controller.themeMode.index == 2
                ? Color(0xff707070).withOpacity(0.1)
                : Theme.of(context).appBarTheme.color, //.withOpacity(0.1),
          ),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 110,
                  width: wp(100),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppAssets.bxs_badge,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "$subscriptionType",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 21.0,
                            fontFamily: 'poppins_medium',
                            // fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    SubscriptionType.price(subscriptionType),
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline1.color,
                      fontSize: 30.0,
                      fontFamily: 'poppins_medium',
                    ),
                  ),
                ),
                Text(
                  "per month",
                  //textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline1.color,
                    fontSize: 18.0,
                    fontFamily: 'poppins_medium',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  width: wp(80),
                  height: 1.0,
                  color: AppColors.ShadowRed,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: wp(80),
                  child: getPlanData(
                    context,
                    text:
                    SubscriptionType.getVideoQualityText(subscriptionType),
                    iconData: SubScriptionIcons.vedio,
                    textDecoration:
                    SubscriptionType.getVideoQuality(subscriptionType),
                  ),
                ),
                Container(
                  width: wp(80),
                  child: getPlanData(
                    context,
                    text: SubscriptionType.getResolutionText(subscriptionType),
                    iconData: SubScriptionIcons.settings,
                    textDecoration:
                    SubscriptionType.getResolution(subscriptionType),
                  ),
                ),
                Container(
                  width: wp(80),
                  child: getPlanData(
                    context,
                    text: "Unlimited Videos & TV Shows",
                    iconData: SubScriptionIcons.doubleup,
                    textDecoration:
                    SubscriptionType.getUnlimitedVideo(subscriptionType),
                  ),
                ),
                Container(
                  width: wp(80),
                  child: getPlanData(
                    context,
                    text: SubscriptionType.getFreeMonthText(subscriptionType),
                    iconData: SubScriptionIcons.boom,
                    textDecoration:
                    SubscriptionType.getFreeMonth(subscriptionType),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  width: wp(80),
                  child: getPlanData(
                    context,
                    text: "Cancel any time",
                    iconData: SubScriptionIcons.croxcircle,
                    textDecoration:
                    SubscriptionType.getCancelAnyTime(subscriptionType),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                //---
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    width: wp(80),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.ShadowRed,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          "CONTINUE",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14.0,
                            fontFamily: 'poppins_bold',
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
