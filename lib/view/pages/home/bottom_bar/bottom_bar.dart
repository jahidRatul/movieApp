import 'package:flutter/material.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/icons/bottom_icon.dart';
import 'package:iotflixcinema/view/widgets/bottom_nav_bar.dart';

import '../homepage.dart';

class AppBottomBar extends StatefulWidget {
  final Function(String) changePage;
  final String page;

  AppBottomBar({
    this.changePage,
    this.page = HomePageFragment.dashboard,
  });

  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new BottomNavigationDot(
        paddingBottomCircle: 1,
        indexSelected: HomePageFragment.getInitialIndex(widget?.page),
        color: AppColors.borderColor,
        backgroundColor: Theme.of(context).appBarTheme.color,
        activeColor: AppColors.deepRed,
        items: [
          new BottomNavigationDotItem(
              icon: BottomIcon.mask_group_1,
              onTap: () {
                widget?.changePage?.call("dashboard");
              }),
          new BottomNavigationDotItem(
              icon: BottomIcon.mask_group_2,
              onTap: () {
                widget?.changePage?.call("explore");
              }),
          new BottomNavigationDotItem(
              icon: BottomIcon.mask_group_3,
              iconSize: 35,
              onTap: () {
                widget?.changePage?.call("live");
              }),
          new BottomNavigationDotItem(
              // icon: BottomIcon.mask_group_5,
              // icon: FontAwesomeIcons.heart,
              icon: Icons.favorite_outline_outlined,
              onTap: () {
                widget?.changePage?.call("favourite");
              }),
          new BottomNavigationDotItem(
              icon: BottomIcon.mask_group_4,
              onTap: () {
                widget?.changePage?.call("profile");
              }),
        ],
        milliseconds: 1,
      ),
    );
  }
}
