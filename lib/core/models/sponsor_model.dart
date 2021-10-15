import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';

class SponsorModel {
  bool status;
  String appUrl;
  Data data;

  SponsorModel({this.status, this.appUrl, this.data});

  SponsorModel.fromJson(Map<String, dynamic> json) {
    this._fromJson(json);
  }

  _fromJson(Map<String, dynamic> json) {
    try {
      status = json['status'];
      appUrl = json['appUrl'];
      data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    } catch (e, t) {
      print(e);
    }
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
      Map<String, dynamic> res = await HttpHelper.get(AppUrls.sponsorUrl);
      if (res == null) return;
      if (res.isEmpty) return;
      print(res);
      return _fromJson(res);
    } catch (e, t) {
      print(e);
    }
  }
}

class Data {
  int currentPage;
  List<Data1> data1;
  String firstPageUrl;
  int from;
  String nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;

  Data(
      {this.currentPage,
      this.data1,
      this.firstPageUrl,
      this.from,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data1 = new List<Data1>();
      json['data'].forEach((v) {
        data1.add(new Data1.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data1 != null) {
      data['data'] = this.data1.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    return data;
  }
}

class Data1 {
  int id;
  Null videoId;
  String title;
  String url;
  String mediaType;
  String img;
  String createdAt;
  String updatedAt;
  Null video;

  Data1(
      {this.id,
      this.videoId,
      this.title,
      this.url,
      this.mediaType,
      this.img,
      this.createdAt,
      this.updatedAt,
      this.video});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoId = json['video_id'];
    title = json['title'];
    url = json['url'];
    mediaType = json['media_type'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video_id'] = this.videoId;
    data['title'] = this.title;
    data['url'] = this.url;
    data['media_type'] = this.mediaType;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['video'] = this.video;
    return data;
  }
}
