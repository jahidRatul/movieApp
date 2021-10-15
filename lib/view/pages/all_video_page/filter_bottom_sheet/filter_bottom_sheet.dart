import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/all_videos_view_model.dart';
import 'package:iotflixcinema/core/view_models/filter_videos_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';

String selectedTime = "all-time";
int selectedResolution = 1080;
enum Quality { quality1080, quality720, quality480, quality360 }

Quality selectedQuality = Quality.quality1080;
enum Year { week, month, year, allTime }

Year selectedYear = Year.allTime;

double _currentSliderValue = maxLikeForFilter.toDouble();
double rating = 3.5;
int starCount = 5;
int _categoryValue = 1;

List<DropdownMenuItem> categoryList = [
  DropdownMenuItem(child: Text("Everything"), value: 1),
  DropdownMenuItem(child: Text("Second Item"), value: 2),
  DropdownMenuItem(child: Text("Third Item"), value: 3),
  DropdownMenuItem(child: Text("Fourth Item"), value: 4)
];

class BottomSheetFilter {
  static bottomSheetPro(BuildContext context) async {
    showModalBottomSheet(
      backgroundColor: AppColors.ShadowRed,
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
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: GetBuilder<FilterVideosViewModel>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              ImageIcon(
                AssetImage(
                  'images/filterArrowIcon.png',
                ),
                size: 18,
                color: AppColors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "Filter",
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories ',
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 140,
                    decoration: BoxDecoration(
                      color: AppColors.glowRed,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        //isExpanded: true,
                        dropdownColor: AppColors.black,
                        iconEnabledColor: Colors.black,
                        isDense: true,
                        value: _categoryValue,
                        items: categoryList,
                        onChanged: (value) {
                          setState(() {
                            _categoryValue = value;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Quality Type ',
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    color: AppColors.glowRed,
                    height: 30,
                    minWidth: 50,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: selectedQuality == Quality.quality1080
                              ? AppColors.yellowColor
                              : AppColors.white,
                          width: selectedQuality == Quality.quality1080 ? 3 : 2,
                          style: BorderStyle.solid),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedQuality = Quality.quality1080;
                        selectedResolution = 1080;
                      });
                    },
                    child: Text(
                      '1080p',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    color: AppColors.glowRed,
                    height: 30,
                    minWidth: 50,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: selectedQuality == Quality.quality720
                              ? AppColors.yellowColor
                              : AppColors.white,
                          width: selectedQuality == Quality.quality720 ? 2 : 1,
                          style: BorderStyle.solid),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedQuality = Quality.quality720;
                        selectedResolution = 720;
                      });
                    },
                    child: Text(
                      '720p',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    color: AppColors.glowRed,
                    height: 30,
                    minWidth: 50,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: selectedQuality == Quality.quality480
                              ? AppColors.yellowColor
                              : AppColors.white,
                          width: selectedQuality == Quality.quality480 ? 2 : 1,
                          style: BorderStyle.solid),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedQuality = Quality.quality480;
                        selectedResolution = 480;
                      });
                    },
                    child: Text(
                      '480p',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    color: AppColors.glowRed,
                    height: 30,
                    minWidth: 50,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: selectedQuality == Quality.quality360
                              ? AppColors.yellowColor
                              : AppColors.white,
                          width: selectedQuality == Quality.quality360 ? 3 : 2,
                          style: BorderStyle.solid),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedQuality = Quality.quality360;
                        selectedResolution = 360;
                      });
                    },
                    child: Text(
                      '360p',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Upload Type ',
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    color: AppColors.glowRed,
                    height: 30,
                    minWidth: 40,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: selectedYear == Year.week
                              ? AppColors.yellowColor
                              : AppColors.white,
                          width: selectedYear == Year.week ? 3 : 2,
                          style: BorderStyle.solid),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedYear = Year.week;
                        selectedTime = "week";
                      });
                    },
                    child: Text(
                      'This Week',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    color: AppColors.glowRed,
                    height: 30,
                    minWidth: 40,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: selectedYear == Year.month
                              ? AppColors.yellowColor
                              : AppColors.white,
                          width: selectedYear == Year.month ? 3 : 2,
                          style: BorderStyle.solid),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedYear = Year.month;
                        selectedTime = "month";
                      });
                    },
                    child: Text(
                      'This Month',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    color: AppColors.glowRed,
                    height: 30,
                    minWidth: 40,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: selectedYear == Year.year
                              ? AppColors.yellowColor
                              : AppColors.white,
                          width: selectedYear == Year.year ? 3 : 2,
                          style: BorderStyle.solid),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedYear = Year.year;
                        selectedTime = "year";
                      });
                    },
                    child: Text(
                      'This Year',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    color: AppColors.glowRed,
                    height: 30,
                    minWidth: 40,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: selectedYear == Year.allTime
                              ? AppColors.yellowColor
                              : AppColors.white,
                          width: selectedYear == Year.allTime ? 3 : 2,
                          style: BorderStyle.solid),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedYear = Year.allTime;
                        selectedTime = "all-time";
                      });
                    },
                    child: Text(
                      'All Time',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Total Like : ${_currentSliderValue.round()}',
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SliderTheme(
                data: SliderThemeData(
                    thumbColor: Colors.white,
                    activeTrackColor: AppColors.yellowColor,
                    valueIndicatorTextStyle: TextStyle(color: Colors.white),
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 8,
                    )),
                child: Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: maxLikeForFilter.toDouble(),
                  divisions: maxLikeForFilter,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (val) {
                    setState(() {
                      _currentSliderValue = val;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          selectedYear = Year.allTime;
                          _currentSliderValue = maxLikeForFilter.toDouble();
                          selectedQuality = Quality.quality1080;
                          selectedTime = "all-time";
                          selectedResolution = 1080;
                        });
                      },
                      textColor: AppColors.white,
                      child: Text(
                        'Clear',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: FlatButton(
                      color: AppColors.black,
                      onPressed: () {
                        controller.getFilterVideosMethod(
                          totalLike: _currentSliderValue.toInt(),
                          resolution: selectedResolution,
                          time: selectedTime,
                        );
                      },
                      textColor: AppColors.white,
                      child: Text(
                        'Apply',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.black),
                          borderRadius: BorderRadius.circular(10)),
                    ),
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
