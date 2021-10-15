import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/register_user_model.dart';
import 'package:iotflixcinema/view/router/app_router.dart';

class RegisterUserViewModel extends GetxController {
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

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  RegisterUserModel registerUserModel = RegisterUserModel();

  registerUserMethod({
    String email,
    String name,
    String password,
    String phone,
    String registerMethod,
  }) async {
    await registerUserModel.callApi(
        name: name,
        email: email,
        phone: phone,
        password: password,
        registerMethod: registerMethod);
    update();

    if (registerUserModel?.data?.bearerToken != null) {
      AppRouter.navToSignInPage();
    } else {
      errorMsgEmail = registerUserModel?.errors?.email?.first ?? "";
      errorMsgPhone = registerUserModel?.errors?.phone?.first ?? "";
    }
  }

  String errorMsgEmail = "";
  String errorMsgPhone = "";
}
