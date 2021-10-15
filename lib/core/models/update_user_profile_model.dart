import 'dart:io';

import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';
import 'package:iotflixcinema/core/utils/local_auth/local_auth_get_storage.dart';

class UpdateUserProfileModel {
  bool status;
  Data data;
  String appUrl;

  UpdateUserProfileModel({this.status, this.data, this.appUrl});

  UpdateUserProfileModel.fromJson(Map<String, dynamic> json) {
    this._fromJson(json);
  }

  _fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    appUrl = json['appUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['appUrl'] = this.appUrl;
    return data;
  }

  Future<void> callApi({
    String name,
    String phone,
    String oldPassword,
    String password,
    File img,
  }) async {
    try {
      String token = "Bearer " + LocalDBUtils.getJWTToken();
      Map<String, dynamic> res = await HttpHelper.uploadFile(
          AppUrls.updateProfileUrl,
          avater: img,
          body: {
            "name": name,
            "phone": phone,
            "password": password,
            "old_password": oldPassword,
            // "img": img,
          },
          headers: {
            "Authorization": "$token"
          });
      if (res == null) return;
      if (res.isEmpty) return;
      print(res);
      this._fromJson(res);
    } catch (e, t) {
      print(e);
    }
  }
}

class Data {
  int id;
  int roleId;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String phone;
  String avatar;
  String registerMethod;
  dynamic fbOrGoogleId;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
      this.roleId,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phone,
      this.avatar,
      this.registerMethod,
      this.fbOrGoogleId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    avatar = json['avatar'];
    registerMethod = json['register_method'];
    fbOrGoogleId = json['fb_or_google_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_id'] = this.roleId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['register_method'] = this.registerMethod;
    data['fb_or_google_id'] = this.fbOrGoogleId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
