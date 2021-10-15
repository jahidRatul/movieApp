import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/utils/local_auth/local_auth_get_storage.dart';
import 'package:iotflixcinema/core/view_models/profile_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/pages/base_screen.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/pages/profile_without_login/profile_widget/profile_widget.dart';
import 'package:iotflixcinema/view/pages/share/share_page.dart';
import 'package:iotflixcinema/view/router/app_router.dart';
import 'package:iotflixcinema/view/widgets/custom_drawer.dart';

class ProfileWithLogIn extends StatefulWidget {
  final int nestedId;

  ProfileWithLogIn({this.nestedId});

  @override
  _ProfileWithLogInState createState() => _ProfileWithLogInState();
}

class _ProfileWithLogInState extends BaseScreen<ProfileWithLogIn>
    with AutomaticKeepAliveClientMixin {
  ProfileViewModel logoutController = Get.put(ProfileViewModel());

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      // backgroundColor: AppColors.pageBackground,
      drawer: CustomDrawer(),
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: AppColors.appBarColor,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10.0),
        //     child: Icon(Icons.search),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GetBuilder<ProfileViewModel>(
          builder: (controller) => SafeArea(
            child: Column(
              children: [
                Container(
                  height: 220,
                  color: Theme.of(context).appBarTheme.color,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Stack(
                        children: [
                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(63),
                            child: CircleAvatar(
                              child: CircleAvatar(
                                radius: 63,
                                backgroundImage: NetworkImage(controller
                                            ?.profileModel?.data?.avatar ==
                                        null
                                    ? 'https://picsum.photos/100'
                                    : AppUrls.imageBaseUrl +
                                        controller?.profileModel?.data?.avatar),
                              ),
                              backgroundColor: AppColors.white,
                              radius: 66,
                            ),
                          ),
                          Positioned(
                            right: hp(0),
                            bottom: wp(0),
                            child: Container(
                              child: Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(63),
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: AppColors.white,
                                  child: IconButton(
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onPressed: () {
                                      AppRouter.navToEditProfilePage(
                                          nestedId: widget?.nestedId);
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: AppColors.deepRed,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: wp(80),
                          child: Center(
                            child: Text(
                              controller?.profileModel?.data?.name ??
                                  "User Name",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          )),
                      Container(
                        width: wp(80),
                        child: Center(
                          child: Text(
                            controller?.profileModel?.data?.email ??
                                "user@user.mail",
                            style: TextStyle(
                                color: AppColors.appAmber,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: wp(100),
                        height: hp(.2),
                        color: AppColors.deepRed,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Account",
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline1.color,
                          fontSize: 15.0,
                          fontFamily: 'poppins_bold'),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).appBarTheme.color,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  margin: EdgeInsets.all(15.0),
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        child: ProfileWidget(
                          iconName: 'images/favorite.png',
                          text: 'Favorite',
                          height: 1.0,
                          onTap: () {
                            AppRouter.navToHomePage(
                                fragment: HomePageFragment.favourite);
                          },
                        ),
                      ),
                      Container(
                        child: ProfileWidget(
                          iconName: 'images/history.png',
                          text: 'History',
                          onTap: () {
                            AppRouter.navToHistoryPage(
                                nestedId: widget?.nestedId);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "General",
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline1.color,
                          fontSize: 15.0,
                          fontFamily: 'poppins_bold'),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).appBarTheme.color,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  margin: EdgeInsets.all(15.0),
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        child: ProfileWidget(
                          iconName: 'images/share.png',
                          text: 'Share',
                          height: 1.0,
                          onTap: () {
// AppRouter.navToSharePage();

                            Navigator.of(context, rootNavigator: false).push(
                                MaterialPageRoute(builder: (_) => SharePage()));
                          },
                        ),
                      ),
                      Container(
                        child: ProfileWidget(
                          iconName: 'images/reports.png',
                          text: 'Reports',
                          height: 1.0,
                        ),
                      ),
                      Container(
                        child: ProfileWidget(
                          iconName: 'images/logout.png',
                          text: 'Logout',
                          onTap: () {
                            // logoutController.getUserProfileMethod();
                            logoutController?.getLogoutMethod();
                            LocalDBUtils.deleteJWTToken();
                            AppRouter.navToSignInPage();

                            // AppRouter.navToSignInPage();
                            // if (LocalDBUtils.getJWTToken() == null) {
                            //   AppRouter.navToSignInPage();
                            // } else {
                            //
                            //
                            // }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
  }
}
