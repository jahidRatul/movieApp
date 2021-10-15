import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';

class HomeBannerModel {
  bool status;
  String appUrl;
  List<Data> data;

  HomeBannerModel({this.status, this.appUrl, this.data});

  HomeBannerModel.fromJson(Map<String, dynamic> json) {
    this._fromJson(json);
  }

  _fromJson(Map<String, dynamic> json) {
    try {
      status = json['status'];
      appUrl = json['appUrl'];
      if (json['data'] != null) {
        data = new List<Data>();
        json['data'].forEach((v) {
          data.add(new Data.fromJson(v));
        });
      }
    } catch (e, t) {
      print(e);
      print(t);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['appUrl'] = this.appUrl;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Future<void> callApi() async {
    try {
      Map<String, dynamic> res = await HttpHelper.get(AppUrls.homeBannerUrl);

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
  Null categoryId;
  dynamic videoId;
  String title;
  String bannerType;
  dynamic url;
  String img;
  String createdAt;
  String updatedAt;
  String pageBelongs;
  Null category;

  Data(
      {this.id,
      this.categoryId,
      this.videoId,
      this.title,
      this.bannerType,
      this.url,
      this.img,
      this.createdAt,
      this.updatedAt,
      this.pageBelongs,
      this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    videoId = json['video_id'];
    title = json['title'];
    bannerType = json['banner_type'];
    url = json['url'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pageBelongs = json['page_belongs'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['video_id'] = this.videoId;
    data['title'] = this.title;
    data['banner_type'] = this.bannerType;
    data['url'] = this.url;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['page_belongs'] = this.pageBelongs;
    data['category'] = this.category;
    return data;
  }
}
