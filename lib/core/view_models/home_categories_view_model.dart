import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/home_categories_model.dart';

class HomeCategoriesViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHomeCategoriesMethod();
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

  HomeCategoriesModel homeCategoriesModel = HomeCategoriesModel();

  getHomeCategoriesMethod() async {
    HomeCategoriesModel temp = HomeCategoriesModel();

    await temp.callApi();
    homeCategoriesModel = temp;
    update();
  }
}
