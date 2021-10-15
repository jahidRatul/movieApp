import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/filter_videos_model.dart';

class FilterVideosViewModel extends GetxController {
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  getFilterVideosMethod({
    int totalLike,
    String time,
    int resolution,
  }) async {
    FilterVideosModel tempModel = FilterVideosModel();
    await tempModel.callApi(
        resolution: resolution, time: time, totalLike: totalLike);
    filterVideosModel = tempModel;
    update();
  }

  FilterVideosModel filterVideosModel = FilterVideosModel();
}
