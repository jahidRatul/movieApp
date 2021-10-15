import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';

class CustomTheme {
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
      colorScheme: ColorScheme.dark().copyWith(
        onSecondary: Colors.white,
      ),
      textTheme: TextTheme(
        headline1:
            AppFontStyle.headline1.copyWith(color: AppColors.darkHeadline1),
        headline2:
            AppFontStyle.headline2.copyWith(color: AppColors.dividerColor),
        headline3: AppFontStyle.headline3.copyWith(color: AppColors.appAmber),
        headline4:
            AppFontStyle.headline4.copyWith(color: AppColors.darkHeadline4),
        headline5: AppFontStyle.headline5,
        headline6: AppFontStyle.headline6,
        bodyText1: AppFontStyle.bodyText1,
        bodyText2: AppFontStyle.bodyText2,
        subtitle1: AppFontStyle.subtitle1,
        subtitle2: AppFontStyle.subtitle2,
      ),
      highlightColor: Color(0xff2A63D4),
      appBarTheme: FlutterAppBarTheme.darkAppBarTheme,
      cardTheme: CardTheme(
        color: AppColors.darkCardColor,
      ),
      iconTheme: IconThemeData(
        color: AppColors.iconColor,
      ));
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.lightScaffoldBackgroundColor,
    colorScheme: ColorScheme.light().copyWith(
      onSecondary: Colors.black,
    ),
    textTheme: TextTheme(
      headline1:
          AppFontStyle.headline1.copyWith(color: AppColors.lightHeadline1),
      headline2: AppFontStyle.headline2.copyWith(color: AppColors.borderColor),
      headline3: AppFontStyle.headline3.copyWith(color: AppColors.ShadowRed),
      headline4:
          AppFontStyle.headline4.copyWith(color: AppColors.lightHeadline4),
      headline5: AppFontStyle.headline5,
      headline6: AppFontStyle.headline6,
      bodyText1: AppFontStyle.bodyText1,
      bodyText2: AppFontStyle.bodyText2,
      subtitle1: AppFontStyle.subtitle1,
      subtitle2: AppFontStyle.subtitle2,
    ),
    highlightColor: Color(0xff2A63D4),
    appBarTheme: FlutterAppBarTheme.lightAppBarTheme,
    cardTheme: CardTheme(
      color: AppColors.lightCardColor,
    ),
  );
}

class AppFontStyle {
  static final TextStyle headline1 = GoogleFonts.poppins();
  static final TextStyle headline2 = GoogleFonts.poppins();
  static final TextStyle headline3 = GoogleFonts.poppins();
  static final TextStyle headline4 = GoogleFonts.poppins();
  static final TextStyle headline5 = GoogleFonts.poppins();
  static final TextStyle headline6 = GoogleFonts.poppins();
  static final TextStyle body1 = GoogleFonts.poppins();
  static final TextStyle body2 = GoogleFonts.poppins();
  static final TextStyle bodyText1 = GoogleFonts.poppins();
  static final TextStyle bodyText2 = GoogleFonts.poppins();
  static final TextStyle subtitle1 = GoogleFonts.poppins();
  static final TextStyle subtitle2 = GoogleFonts.poppins();
  static final TextStyle subtitle = GoogleFonts.poppins();
  static final TextStyle subhead = GoogleFonts.poppins();
}

class FlutterAppBarTheme {
  static final lightAppBarTheme = AppBarTheme(
    brightness: Brightness.light,
    iconTheme: IconThemeData(
      color: AppColors.lightAppBarTitleTextColor,
    ),
    textTheme: ThemeData.dark().textTheme.copyWith(
          headline6: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: AppColors.lightAppBarTitleTextColor,
          ),
        ),
    color: AppColors.lightAppBarBackgroundColor,
  );

  static final darkAppBarTheme = AppBarTheme(
    brightness: Brightness.dark,
    iconTheme: IconThemeData(
      color: AppColors.darkAppBarTitleTextColor,
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          headline6: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: AppColors.darkAppBarTitleTextColor,
          ),
        ),
    color: AppColors.darkAppBarBackgroundColor,
  );
}
