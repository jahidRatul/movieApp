import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/profile_view_model.dart';

class UpdateUserProfileBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProfileViewModel());
  }
}
