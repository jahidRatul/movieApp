import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';

class SharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      // backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        title: Text(
          'Share',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              fontFamily: 'poppins_medium'),
        ),
        centerTitle: true,
        elevation: 0,
        //  backgroundColor: AppColors.appBarColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            child: ImageIcon(
              AssetImage('images/backIcon.png'),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'images/shareImg.png',
                  height: hp(35),
                  width: wp(80),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Use the link below to refer your friends',
                style: TextStyle(
                    color: AppColors.shareTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                margin: EdgeInsets.only(left: 22.0, right: 22.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.colorGray, width: .5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            'https://videopapp.com/invite-iotait-sdfas-asdf',
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                                color: AppColors.shareTextColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: AppColors.black,
                      child: Center(
                        child: Text(
                          'COPY',
                          style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.w900,
                              fontFamily: 'poppins_bold',
                              color: AppColors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Or send via',
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).textTheme.headline1.color,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/skypeIcon.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Image.asset(
                    'images/fbIcon.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Image.asset(
                    'images/twitter.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Image.asset(
                    'images/instaIcon.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Image.asset(
                    'images/youtubeIcon.png',
                    width: 40,
                    height: 40,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
