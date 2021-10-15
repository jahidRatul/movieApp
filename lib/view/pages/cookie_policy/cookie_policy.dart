import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:iotflixcinema/view/cards/app_bars/app_bar_with_title.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/router/app_router.dart';

class CookiePolicy extends StatefulWidget {
  final String policyText;

  CookiePolicy({this.policyText});

  @override
  _CookiePolicyState createState() => _CookiePolicyState();
}

class _CookiePolicyState extends State<CookiePolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IotaAppBar.appBarWithTitle(
          title: "Cookie Policy",
          borderColor: AppColors.deepRed,
          backButtonOnTap: () {
            AppRouter.back();
          }),
      body: Container(
        child: Html(
          data: widget.policyText,
          style: {
            "body": Style(textAlign: TextAlign.center),
          },
        ),
      ),
    );
  }
}
