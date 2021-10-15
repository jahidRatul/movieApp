import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/home_banner_model.dart';

class HomeBannerViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBannerMethod();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  getBannerMethod() async {
    await homeBannerModel.callApi();
    update();
  }

  HomeBannerModel homeBannerModel = HomeBannerModel();
}
