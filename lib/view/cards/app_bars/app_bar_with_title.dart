import 'package:flutter/material.dart';
import 'package:iotflixcinema/view/router/app_router.dart';

class IotaAppBar {
  static Widget appBarWithTitle({
    Function backButtonOnTap,
    String title,
    Color borderColor,
  }) =>
      AppBar(
        title: Text(
          title ?? '',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            fontFamily: 'poppins_medium',
          ),
        ),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: AppColors.appBarColor,
        leading: GestureDetector(
          onTap: backButtonOnTap,
          child: Container(
            alignment: Alignment.center,

            child: ImageIcon(
              AssetImage('images/backIcon.png'),
            ),
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            color: borderColor ?? Colors.transparent,
            height: .5,
          ),
          preferredSize: Size.fromHeight(1.5),
        ),
      );

  static Widget basicAppBarWithSearchIcon() => AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                AppRouter.navToExploreSearchPage();
              },
              child: ImageIcon(
                AssetImage('images/searchIcon.png'),
                size: 18,
              ),
            ),
          ),
        ],
      );
}
