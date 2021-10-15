import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/search/search_result_model.dart';
import 'package:iotflixcinema/core/repo/search/search_repo.dart';

class SearchViewModel extends GetxController {
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSearchSuggestion();
    searchQuery();
  }

  getSearchSuggestion() async {
    List<String> tempList = await SearchRepo().getSearchSuggestion();
    searchSuggestion?.assignAll(tempList);
    update();
  }

  searchQuery({String value}) async {
    SearchResultModel temp = SearchResultModel();
    await temp.callApi(value: value);
    searchResultModel = temp;
    update();
  }

  addToSuggestionList(String s) {
    if (s == null) return;
    searchSuggestion?.add(s);
  }

  RxList<String> searchSuggestion = RxList();
  SearchResultModel searchResultModel = SearchResultModel();
}
