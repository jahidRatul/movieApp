import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/fevorite_view_model.dart';
import 'package:iotflixcinema/core/view_models/history_view_model/history_view_model.dart';
import 'package:iotflixcinema/core/view_models/home_view_model.dart';
import 'package:iotflixcinema/core/view_models/search/search_view_model.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(HomeViewModel());
    Get.put(FavoriteViewModel());
    Get.lazyPut(() => SearchViewModel());
    //  Get.put(HistoryViewModel());
  }
}
