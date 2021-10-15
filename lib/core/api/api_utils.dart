class ApiUtils {
  static String getError(Map<String, dynamic> errors) {
    try {
      print("start error parsing");
      if (errors == null) return null;

      // Map<String, dynamic> errorMessage = new Map();

      List<String> keys = errors.keys.toList();
      print(keys);
      List<String> errorsList = new List();
      if (keys.length < 1) return null;
      keys.forEach((element) {
        if (errors[element] is String) {
          errorsList.add(errors[element]);
        } else
          errors[element].forEach((e) {
            // print(e);
            errorsList.add(e);
          });
      });

      print(errorsList);
      if (errorsList.length > 0)
        return errorsList.first;
      else
        return null;
    } catch (e, t) {
      print("json parsing crush");
      print(e);
      print(t);
      return null;
    }
  }
}
