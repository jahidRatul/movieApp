import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/theme_view_model.dart';

class SubScribePageBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ThemeController());
  }
}
