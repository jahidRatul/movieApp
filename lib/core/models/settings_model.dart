import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';

class SettingsModel {
  bool status;
  String appUrl;
  Data data;

  SettingsModel({this.status, this.appUrl, this.data});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    this._fromJson(json);
  }

  _fromJson(Map<String, dynamic> json) {
    status = json['status'];
    appUrl = json['appUrl'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['appUrl'] = this.appUrl;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }

  Future<void> callApi() async {
    try {
      Map<String, dynamic> res = await HttpHelper.get(AppUrls.settingsUrl);
      if (res == null) return;
      if (res.isEmpty) return;
      print(res);
      this._fromJson(res);
    } catch (e, t) {}
  }
}

class Data {
  int id;
  String title;
  String appVersion;
  String email;
  String img;
  String moreapp;
  String weblink;
  Null facebook;
  Null instagram;
  Null youtube;
  Null twitter;
  String developBy;
  String copyRight;
  String appDescription;
  String firebaseLegacykey;
  String firebaseAppid;
  String urlGoogleplay;
  String privacyPolicy;
  String cookiePolicy;
  String termsCondition;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
      this.title,
      this.appVersion,
      this.email,
      this.img,
      this.moreapp,
      this.weblink,
      this.facebook,
      this.instagram,
      this.youtube,
      this.twitter,
      this.developBy,
      this.copyRight,
      this.appDescription,
      this.firebaseLegacykey,
      this.firebaseAppid,
      this.urlGoogleplay,
      this.privacyPolicy,
      this.cookiePolicy,
      this.termsCondition,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    appVersion = json['app_version'];
    email = json['email'];
    img = json['img'];
    moreapp = json['moreapp'];
    weblink = json['weblink'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    youtube = json['youtube'];
    twitter = json['twitter'];
    developBy = json['develop_by'];
    copyRight = json['copy_right'];
    appDescription = json['app_description'];
    firebaseLegacykey = json['firebase_legacykey'];
    firebaseAppid = json['firebase_appid'];
    urlGoogleplay = json['url_googleplay'];
    privacyPolicy = json['privacy_policy'];
    cookiePolicy = json['cookie_policy'];
    termsCondition = json['terms_condition'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['app_version'] = this.appVersion;
    data['email'] = this.email;
    data['img'] = this.img;
    data['moreapp'] = this.moreapp;
    data['weblink'] = this.weblink;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['youtube'] = this.youtube;
    data['twitter'] = this.twitter;
    data['develop_by'] = this.developBy;
    data['copy_right'] = this.copyRight;
    data['app_description'] = this.appDescription;
    data['firebase_legacykey'] = this.firebaseLegacykey;
    data['firebase_appid'] = this.firebaseAppid;
    data['url_googleplay'] = this.urlGoogleplay;
    data['privacy_policy'] = this.privacyPolicy;
    data['cookie_policy'] = this.cookiePolicy;
    data['terms_condition'] = this.termsCondition;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
