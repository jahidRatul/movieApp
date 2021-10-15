import 'package:flutter/material.dart';
import 'package:iotflixcinema/view/cards/cast/cast_card.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              CastCard(),
            ],
          ),
        ),
      ),
    );
  }
}
