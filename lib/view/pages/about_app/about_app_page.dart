import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';

class AboutAppPage extends StatelessWidget {
  final String title;
  final String version;
  final String mail;
  final String url;
  final String moreApp;
  final String developedBy;
  final String copyRight;
  final String description;

  AboutAppPage(
      {this.title,
      this.version,
      this.mail,
      this.url,
      this.moreApp,
      this.developedBy,
      this.copyRight,
      this.description});

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      //  backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        title: Text(
          'About App',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              fontFamily: 'poppins_medium'),
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
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 12),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.color,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    AboutListWidget(
                      imgPath: "images/iotaVideoApp.png",
                      showText: title,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AboutListWidget(
                      imgPath: "images/version.png",
                      showText: version,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AboutListWidget(
                      imgPath: "images/videomail.png",
                      showText: mail,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AboutListWidget(
                      imgPath: "images/link.png",
                      showText: url,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AboutListWidget(
                      imgPath: "images/moreapp.png",
                      showText: moreApp,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AboutListWidget(
                      imgPath: "images/developedby.png",
                      showText: developedBy,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AboutListWidget(
                      imgPath: "images/copyright.png",
                      showText: copyRight,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.color,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Text(description ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline1.color,
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(
                height: 30,
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
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutListWidget extends StatelessWidget {
  final String imgPath;
  final String showText;

  AboutListWidget({this.imgPath, this.showText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60.0),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(imgPath),
            color: AppColors.ShadowRed,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            showText,
            style: TextStyle(
                color: Theme.of(context).textTheme.headline1.color,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
