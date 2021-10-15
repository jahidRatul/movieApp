import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/widgets/round_border_button.dart';

import 'rating_bar.dart';

double _rating;
bool _isVertical = false;
String rateText = 'good';

class BottomSheetRating {
  static bottomSheetPro(BuildContext context) async {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return BottomSheetWidget();
      },
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  // BottomSheetWidget();
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  void dispose() {
    // TODO: implement dispose
    rateText = 'good';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, -.5),
              color: AppColors.ShadowRed,
            )
          ]),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Rate This App",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.headline1.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            RatingBar.builder(
              initialRating: 3,
              direction: _isVertical ? Axis.vertical : Axis.horizontal,
              itemCount: 5,
              text: rateText,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Container(
                      child: Image.asset(
                        'images/rate1.png',
                      ),
                    );
                  case 1:
                    return Container(
                      child: Image.asset(
                        'images/rate2.png',
                      ),
                    );
                  case 2:
                    return Container(
                      child: Image.asset(
                        'images/rate6.png',
                      ),
                    );
                  case 3:
                    return Container(
                      child: Image.asset(
                        'images/rate4.png',
                      ),
                    );
                  case 4:
                    return Container(
                      child: Image.asset(
                        'images/rate5.png',
                      ),
                    );
                  default:
                    return Container();
                }
              },
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                  if (_rating == 1) {
                    rateText = 'bad';
                  } else if (_rating == 2) {
                    rateText = 'not good';
                  } else if (_rating == 3) {
                    rateText = 'good';
                  } else if (_rating == 4) {
                    rateText = 'very good';
                  } else if (_rating == 5) {
                    rateText = 'excellent';
                  }
                });
              },
              updateOnDrag: true,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: RoundBoarderButton(
                    text: 'Do Later',
                    padding: 0,
                    margin: EdgeInsets.zero,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () {},
                  child: RoundBoarderButton(
                    text: 'Rate It',
                    padding: 0,
                    margin: EdgeInsets.zero,
                    backGroundColor: AppColors.greenButton,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
