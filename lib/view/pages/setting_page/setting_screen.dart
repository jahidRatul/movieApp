import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/settings_view_model.dart';
import 'package:iotflixcinema/core/view_models/theme_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/router/app_router.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _lights = false;
  bool _allowNotifications = true;
  ThemeMode _themeMode;

  @override
  Widget build(BuildContext context) {
    _themeMode = ThemeController.to.themeMode;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Settings',
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
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            child: ImageIcon(
              AssetImage('images/backIcon.png'),
              color: Theme.of(context).appBarTheme.textTheme.headline6.color,
            ),
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            color: AppColors.deepRed,
            height: .5,
          ),
          preferredSize: Size.fromHeight(1.5),
        ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<SettingsViewModel>(
          builder: (controller) => Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 20, right: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage('images/notificationIcon.png'),
                            color: AppColors.ShadowRed,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Allow Notification',
                            style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.headline1.color,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Switch(
                        activeColor: AppColors.switchActive,
                        inactiveThumbColor: AppColors.switchActive,
                        activeTrackColor: AppColors.ShadowRed,
                        value: _allowNotifications,
                        onChanged: (bool value) {
                          setState(() {
                            _allowNotifications = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage('images/dark-mode.png'),
                            color: AppColors.ShadowRed,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Light Mode',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline1.color,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      GetBuilder<ThemeController>(
                        builder: (controller) => Switch(
                          activeColor: AppColors.switchActive,
                          inactiveThumbColor: AppColors.switchActive,
                          activeTrackColor: AppColors.ShadowRed,
                          value: _themeMode.index != 2,
                          onChanged: (bool value) {
                            setState(() {
                              controller.setThemeMode(value == false
                                  ? ThemeMode.dark
                                  : ThemeMode.light);
                              _lights = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage('images/profile.png'),
                        color: AppColors.ShadowRed,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRouter.navToEditProfilePage();
                        },
                        child: Text(
                          'Profile Setting',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline1.color,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage('images/aboutApp.png'),
                        color: AppColors.ShadowRed,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRouter.navToAboutAppPage(
                            title: controller?.settingsModel?.data?.title ??
                                "title",
                            description: controller
                                    ?.settingsModel?.data?.appDescription ??
                                "description",
                            copyRight:
                                controller?.settingsModel?.data?.copyRight ??
                                    "copyRight",
                            developedBy:
                                controller?.settingsModel?.data?.developBy ??
                                    "developBy",
                            mail: controller?.settingsModel?.data?.email ??
                                "mail",
                            moreApp: controller?.settingsModel?.data?.moreapp ??
                                "moreapp",
                            url: controller?.settingsModel?.data?.weblink ??
                                "weblink",
                            version:
                                controller?.settingsModel?.data?.appVersion ??
                                    "appVersion",
                          );
                        },
                        child: Text(
                          'About App',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline1.color,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      AppRouter.navToPrivacyPolicy(
                          privacyPolicyText:
                              controller?.settingsModel?.data?.privacyPolicy ??
                                  " Privacy Policy");
                    },
                    child: Row(
                      children: [
                        ImageIcon(
                          AssetImage('images/privacyPolicy.png'),
                          color: AppColors.ShadowRed,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Privacy Policy',
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      AppRouter.navToTermsOfUsePage(
                          termUseText:
                              controller?.settingsModel?.data?.termsCondition ??
                                  "Terms of Policy");
                    },
                    child: Row(
                      children: [
                        ImageIcon(
                          AssetImage('images/term.png'),
                          color: AppColors.ShadowRed,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Terms of Use',
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      AppRouter.navToCookiePolicy(
                          policyText:
                              controller?.settingsModel?.data?.cookiePolicy ??
                                  "Cookie Policy");
                    },
                    child: Row(
                      children: [
                        ImageIcon(
                          AssetImage('images/cookie.png'),
                          color: AppColors.ShadowRed,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Cookie Policy',
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
