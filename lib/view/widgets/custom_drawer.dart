import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/view_models/profile_view_model.dart';
import 'package:iotflixcinema/main.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/router/app_router.dart';

import 'rating/rating_bottom_sheet.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle drawerItemTextStyle = TextStyle(
      color: Theme.of(context).textTheme.headline1.color,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );
    return Drawer(
      child: GetBuilder<ProfileViewModel>(
        builder: (controller) => Container(
          // color: AppColors.pageBackground,
          child: Column(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: MemoryImage(drawerImage),
                  fit: BoxFit.cover,
                )),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        AppRouter.navToProfileWithLogIn();
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            radius: 25,
                            child: Container(
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                                border:
                                    Border.all(color: Colors.white, width: 2.0),
                                image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      controller?.profileModel?.data?.avatar ==
                                              null
                                          ? 'https://picsum.photos/100'
                                          : AppUrls.imageBaseUrl +
                                              controller
                                                  ?.profileModel?.data?.avatar),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Center(
                                child: Text(
                                  controller?.profileModel?.data?.name ??
                                      "User Name",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14),
                                ),
                              )),
                              Container(
                                child: Center(
                                  child: Text(
                                    controller?.profileModel?.data?.email ??
                                        "user@user.mail",
                                    style: TextStyle(
                                        color: AppColors.appAmber,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    ListTile(
                      dense: true,
                      title: Row(
                        children: [
                          ImageIcon(
                            AssetImage('images/homeImg.png'),
                            size: 30,
                            color: AppColors.ShadowRed,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'HOME',
                            style: drawerItemTextStyle,
                          ),
                        ],
                      ),
                      onTap: () {
                        AppRouter.navToHomePage(
                            fragment: HomePageFragment.dashboard);
                      },
                    ),
                    Divider(
                      color: AppColors.dividerColor,
                      thickness: .3,
                    ),
                    ListTile(
                      dense: true,
                      title: Row(
                        children: [
                          ImageIcon(
                            AssetImage('images/ExploreImg.png'),
                            size: 30,
                            color: AppColors.ShadowRed,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Explore',
                            style: drawerItemTextStyle,
                          ),
                        ],
                      ),
                      onTap: () {
                        AppRouter.navToHomePage(
                            fragment: HomePageFragment.explore);
                      },
                    ),
                    Divider(
                      color: AppColors.dividerColor,
                      thickness: .3,
                    ),
                    ListTile(
                      dense: true,
                      title: Row(
                        children: [
                          ImageIcon(
                            AssetImage('images/videoImg.png'),
                            size: 30,
                            color: AppColors.ShadowRed,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Video',
                            style: drawerItemTextStyle,
                          ),
                        ],
                      ),
                      onTap: () {
                        AppRouter.navToHomePage(
                            fragment: HomePageFragment.live);
                      },
                    ),
                    Divider(
                      color: AppColors.dividerColor,
                      thickness: .3,
                    ),
                    ListTile(
                      dense: true,
                      title: Row(
                        children: [
                          ImageIcon(
                            AssetImage('images/favorite.png'),
                            size: 30,
                            color: AppColors.ShadowRed,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Favorite',
                            style: drawerItemTextStyle,
                          ),
                        ],
                      ),
                      onTap: () {
                        AppRouter.navToHomePage(
                            fragment: HomePageFragment.favourite);
                      },
                    ),
                    Divider(
                      color: AppColors.dividerColor,
                      thickness: .3,
                    ),
                    ListTile(
                      dense: true,
                      title: Row(
                        children: [
                          ImageIcon(
                            AssetImage('images/settingDrawer.png'),
                            color: AppColors.ShadowRed,
                            size: 30,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'SETTINGS',
                            style: drawerItemTextStyle,
                          ),
                        ],
                      ),
                      onTap: () {
                        AppRouter.navToSettingScreen();
                      },
                    ),
                    Divider(
                      color: AppColors.dividerColor,
                      thickness: .3,
                    ),
                    ListTile(
                      dense: true,
                      title: Row(
                        children: [
                          ImageIcon(
                            AssetImage('images/helpDrawer.png'),
                            size: 30,
                            color: AppColors.ShadowRed,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Help & Feedback',
                            style: drawerItemTextStyle,
                          ),
                        ],
                      ),
                      onTap: () {
                        AppRouter.navToHelpFeedbackPage();
                      },
                    ),
                    Divider(
                      color: AppColors.dividerColor,
                      thickness: .3,
                    ),
                    ListTile(
                      dense: true,
                      title: Row(
                        children: [
                          ImageIcon(
                            AssetImage('images/share.png'),
                            size: 30,
                            color: AppColors.ShadowRed,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'SHARE',
                            style: drawerItemTextStyle,
                          ),
                        ],
                      ),
                      onTap: () {
                        AppRouter.navToSharePage();
                      },
                    ),
                    Divider(
                      color: AppColors.dividerColor,
                      thickness: .3,
                    ),
                    ListTile(
                      dense: true,
                      title: Row(
                        children: [
                          ImageIcon(
                            AssetImage('images/rateus.png'),
                            size: 30,
                            color: AppColors.ShadowRed,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'RATE US',
                            style: drawerItemTextStyle,
                          ),
                        ],
                      ),
                      onTap: () async {
                        Navigator.pop(context);
                        await BottomSheetRating.bottomSheetPro(context);
                      },
                    ),
                    Divider(
                      color: AppColors.dividerColor,
                      thickness: .3,
                    ),
                    ListTile(
                      dense: true,
                      title: Row(
                        children: [
                          ImageIcon(
                            AssetImage('images/subscribe.png'),
                            size: 30,
                            color: AppColors.ShadowRed,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Subscribe Ad free',
                            style: drawerItemTextStyle,
                          ),
                        ],
                      ),
                      onTap: () {
                        AppRouter.navToSubscriptionPlan();
                      },
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8, top: 10),
                child: Text(
                  'Version 1.01.01.11',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline1.color,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
