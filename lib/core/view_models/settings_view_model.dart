import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/settings_model.dart';

class SettingsViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSettingsMethod();
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

  SettingsModel settingsModel = SettingsModel();

  getSettingsMethod() async {
    await settingsModel.callApi();
    update();
  }
}
