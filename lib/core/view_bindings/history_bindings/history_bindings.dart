import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/history_view_model/history_view_model.dart';
import 'package:iotflixcinema/core/view_models/video_view_view_model.dart';

class HistoryBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(HistoryViewModel());
   // Get.put(HistoryViewModel())?.getHistoryData();
    Get.lazyPut(() => VideoViewViewModel());
  }
}
