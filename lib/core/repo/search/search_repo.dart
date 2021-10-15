import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';

class SearchRepo extends GetConnect {
  Future<List<String>> getSearchSuggestion() async {
    try {
      Map<String, dynamic> res = await HttpHelper.get(AppUrls.searchSuggestion);
      if (res == null) return new List();
      if (res['status'] == false) return List();
      List t = res['data'];

      List<String> searchList = new List();

      t.forEach((element) {
        searchList?.add(element?.toString());
      });

      return searchList;
    } catch (e, t) {
      print(e);
      print(t);
      return new List();
    }
  }
}
