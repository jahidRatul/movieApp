import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';

class SignInModel {
  bool status;
  Data data;
  String msg;

  SignInModel({this.status, this.data, this.msg});

  SignInModel.fromJson(Map<String, dynamic> json) {
    this._fromJson(json);
  }

  _fromJson(Map<String, dynamic> json) {
    try {
      status = json['status'];
      data = json['data'] != null ? new Data.fromJson(json['data']) : null;
      msg = json['msg'];
    } catch (e, t) {
      print(e);
      print(t);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['msg'] = this.msg;
    return data;
  }

  Future<void> callApi({
    String email,
    String password,
    String loginMethod,
  }) async {
    try {
      Map<String, dynamic> res = await HttpHelper.post(
        AppUrls.loginUserUrl,
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: {
          "email": email,
          "password": password,
          "login_method": loginMethod,
        },
      );
      print(res);
      if (res == null) return;
      if (res.isEmpty) return;
      this._fromJson(res);
    } catch (e, t) {
      print(e);
      print(t);
    }
  }
}

class Data {
  int id;
  int roleId;
  String name;
  String email;
  Null emailVerifiedAt;
  String phone;
  dynamic avatar;
  String registerMethod;
  Null fbOrGoogleId;
  String createdAt;
  String updatedAt;
  String bearerToken;

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
      this.updatedAt,
      this.bearerToken});

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
    bearerToken = json['bearer_token'];
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
    data['bearer_token'] = this.bearerToken;
    return data;
  }
}
