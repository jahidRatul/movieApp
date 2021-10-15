import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:iotflixcinema/view/cards/app_bars/app_bar_with_title.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/router/app_router.dart';

class TermsOfUsePage extends StatefulWidget {
  final String termUseText;

  TermsOfUsePage({this.termUseText});

  @override
  _TermsOfUsePageState createState() => _TermsOfUsePageState();
}

class _TermsOfUsePageState extends State<TermsOfUsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IotaAppBar.appBarWithTitle(
        title: "Terms Of Use",
        borderColor: AppColors.deepRed,
        backButtonOnTap: () {
          AppRouter.back();
        },
      ),
      body: Container(
        child: Html(
          data: widget.termUseText,
          style: {
            "body": Style(textAlign: TextAlign.center),
          },
        ),
      ),
    );
  }
}
