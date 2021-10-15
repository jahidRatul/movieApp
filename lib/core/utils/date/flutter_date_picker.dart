import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class FlutterDatePicker {
  static Future<String> selectDate(BuildContext context) async {
    if (Platform.isAndroid == true) {
      DateTime selectedDate = DateTime.now();
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        //lastDate: DateTime(2101),
        lastDate: DateTime.now(),
      );
      return picked.toString();
    } else {
      return getIosDatePicker(context);
    }
  }

  static Future<String> timePicker(BuildContext context) async {
    Future<TimeOfDay> selectedTime24Hour = showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 12, minute: 00),
        builder: (BuildContext c, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child,
          );
        });

    TimeOfDay t = await selectedTime24Hour;

    String m = t.minute.toString();
    if (t.minute.toString().length == 1) {
      m = "0" + t.minute.toString();
    }
    String h = t.hour.toString();
    if (t.hour.toString().length == 1) {
      h = "0" + t.hour.toString();
    }

    return h + ":" + m;
  }

  static Future<String> getIosDatePicker(BuildContext context) async {
    DateTime dateTime = await DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1901, 1),
        maxTime: DateTime.now(),
        currentTime: DateTime.now(),
        locale: LocaleType.en);
    print("ios $dateTime");
    return dateTime.toString();
  }
}
