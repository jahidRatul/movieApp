import 'package:flutter/material.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget(
      {@required this.iconName, @required this.text, this.height, this.onTap});

  final String iconName;
  final String text;
  final double height;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage(iconName),
                    color: AppColors.deepRed,
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        text,
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline1.color,
                            fontFamily: 'poppins_bold',
                            fontSize: 15.0),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  ImageIcon(
                    AssetImage('images/forward_arrow.png'),
                    color: Theme.of(context).textTheme.headline1.color,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: height,
              color: AppColors.borderColor,
            )
          ],
        ),
      ),
    );
  }
}
