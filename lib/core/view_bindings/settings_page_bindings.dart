import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/settings_view_model.dart';
import 'package:iotflixcinema/core/view_models/theme_view_model.dart';

class SettingsPageBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ThemeController());
    Get.put(SettingsViewModel());
  }
}
