import 'dart:io';

import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/logout_model.dart';
import 'package:iotflixcinema/core/models/profile_model.dart';
import 'package:iotflixcinema/core/models/update_user_profile_model.dart';
import 'package:iotflixcinema/core/utils/local_auth/local_auth_get_storage.dart';

class ProfileViewModel extends GetxController {
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  getLogoutMethod() async {
    if (LocalDBUtils.getJWTToken() != null) {
      LogoutModel temp = LogoutModel();
      await temp?.callApi();
      logoutModel = temp;
      update();
    }
    return;
  }

  LogoutModel logoutModel = LogoutModel();

  getUserProfileMethod() async {
    // if (LocalDBUtils.getJWTToken() != null) {
    ProfileModel tempModel = ProfileModel();
    await tempModel?.callApi();
    profileModel = tempModel;
    update();
    // }

    // return;
  }

  ProfileModel profileModel = ProfileModel();

  getUpdateUserProfileMethod({
    String name,
    String phone,
    String oldPassword,
    String password,
    File img,
  }) async {
    await updateProfileViewModel.callApi(
      name: name,
      password: password,
      phone: phone,
      oldPassword: oldPassword,
      img: img,
    );
    getUserProfileMethod();

    update();
  }

  UpdateUserProfileModel updateProfileViewModel = UpdateUserProfileModel();
}
