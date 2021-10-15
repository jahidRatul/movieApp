class Log {
  static void log(dynamic data) {
    bool debug = true;
    if (debug == true) {
      print('$data');
    }
  }
}
