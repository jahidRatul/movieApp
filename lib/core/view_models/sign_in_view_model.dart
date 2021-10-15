import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/sign_in_user_model.dart';
import 'package:iotflixcinema/core/utils/local_auth/local_auth_get_storage.dart';
import 'package:iotflixcinema/core/utils/log/log.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/router/app_router.dart';

class SignInViewModel extends GetxController {
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

  signInMethod({
    String email,
    String password,
    String loginMethod,
  }) async {
    await signInModel.callApi(
        email: email, password: password, loginMethod: loginMethod);
    update();

    if (signInModel?.data?.bearerToken != null) {
      LocalDBUtils.saveJWTToken(signInModel?.data?.bearerToken);
      Log.log("getJWTToken:-  ${LocalDBUtils.getJWTToken()}");
      AppRouter.navToHomePage(fragment: HomePageFragment.dashboard);
    } else {
      errorMsg.value = signInModel?.msg?.toString() ?? "";
      // print(errorMsg.value);
    }
  }

  RxString errorMsg = ''.obs;
  SignInModel signInModel = SignInModel();
}
