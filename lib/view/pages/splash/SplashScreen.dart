import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:iotflixcinema/core/utils/local_auth/local_auth_get_storage.dart';
import 'package:iotflixcinema/core/utils/log/log.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/router/app_router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Timer _timer;
  Animation<double> animation;
  AnimationController controller;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
    controller?.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0, end: 70).animate(controller)
      ..addStatusListener(
        (state) {
          print('$state');
          if (state == AnimationStatus.completed) {
            String token = LocalDBUtils.getJWTToken();
            Log.log("bearer_token :-  $token");
            if (token == null) {
              AppRouter.navToSignInPage();
            } else {
              AppRouter.navToHomePage();
            }
          }
        },
      );

    controller.forward();

// _timer = Timer(Duration(seconds: 3), () => AppRouter.navToSignInPage());
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff1D1D27).withOpacity(0.5),
          ),
          child: Align(
            alignment: Alignment(0, 0.8),
            child: Container(
              child: AnimatedBuilder(
                animation: animation,
                builder: (_, child) => Container(
                  height: 2,
                  width: wp(70),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 2,
                      width: wp(animation.value),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red,
                      ),
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
