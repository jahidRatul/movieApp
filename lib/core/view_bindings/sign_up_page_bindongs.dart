import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/register_user_view_model.dart';

class SignUpPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RegisterUserViewModel());
  }
}
