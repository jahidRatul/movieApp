import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/search/search_view_model.dart';

class SearchBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SearchViewModel());
  }
}
