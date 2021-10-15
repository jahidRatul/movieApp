import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:iotflixcinema/view/cards/app_bars/app_bar_with_title.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/router/app_router.dart';

class PrivacyPolicy extends StatefulWidget {
  final String privacyPolicyText;

  PrivacyPolicy({this.privacyPolicyText});

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IotaAppBar.appBarWithTitle(
          title: "Privacy Policy",
          borderColor: AppColors.deepRed,
          backButtonOnTap: () {
            AppRouter.back();
          }),
      body: Container(
        child: Html(
          data: widget.privacyPolicyText,
          style: {
            "body": Style(textAlign: TextAlign.center),
          },
        ),
      ),
    );
  }
}
