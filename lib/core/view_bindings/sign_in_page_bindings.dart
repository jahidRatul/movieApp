import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/history_view_model/history_view_model.dart';
import 'package:iotflixcinema/core/view_models/sign_in_view_model.dart';

class SignInPageBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SignInViewModel());

    // Get.put(ProfileViewModel());
  }
}
