import 'package:get/get.dart';

class AppValidTor {
  static String isEmail(String s) =>
      GetUtils.isEmail(s) ? null : "Please enter a valid email";

  static String isEmpty(String s) =>
      GetUtils.isNullOrBlank(s) ? "this field required!" : null;

  static String isPassword(String s) {
    if (s.isBlank || s.isEmpty) return "this field required!";
    return GetUtils.isLengthLessThan(s, 8) ? "min password length is 8" : null;
  }

  static String isConfirmedPassword(String s, String password) {
    return s != password ? "both password not matched" : null;
  }

  static String isMobile(String s) {
    if (s.isBlank || s.isEmpty) return "this field required!";
    return GetUtils.isLengthLessThan(s, 8) ? "min password length is 8" : null;
  }
}
