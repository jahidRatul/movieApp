import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/pages/base_screen.dart';
import 'package:iotflixcinema/view/pages/profile_without_login/profile_widget/profile_widget.dart';
import 'package:iotflixcinema/view/router/app_router.dart';
import 'package:iotflixcinema/view/widgets/round_border_button.dart';

class ProfileWithoutLogIn extends StatefulWidget {
  final int nestedId;

  ProfileWithoutLogIn({this.nestedId});

  @override
  _ProfileWithoutLogInState createState() => _ProfileWithoutLogInState();
}

class _ProfileWithoutLogInState extends BaseScreen<ProfileWithoutLogIn> {
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.color,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        // backgroundColor: AppColors.pageBackground,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: hp(35),
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Stack(
                      children: [
                        Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(66),
                          child: CircleAvatar(
                            radius: 66,
                            backgroundColor: AppColors.white,
                            child: CircleAvatar(
                              radius: 63,
                              backgroundImage: AssetImage(
                                'images/noProfile.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: wp(50),
                      child: RoundBoarderButton(
                        text: "Sign In",
                        padding: 5.0,
                        backGroundColor: AppColors.appAmber,
                        onPress: () {
                          AppRouter.navToSignInPage();
                        },
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
                    color: Theme.of(context).scaffoldBackgroundColor,
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
                          AppRouter.navToSharePage();
                          print('object');
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
                        iconName: 'images/settings.png',
                        text: 'Settings',
                        onTap: () {
                          AppRouter.navToSettingScreen();
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
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
  }
}
