import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';
import 'package:iotflixcinema/core/utils/local_auth/local_auth_get_storage.dart';

class AddReportsModel {
  bool status;
  String appUrl;
  Data data;

  AddReportsModel({this.status, this.appUrl, this.data});

  AddReportsModel.fromJson(Map<String, dynamic> json) {
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

  Future<void> callApi({
    String id,
    String description,
  }) async {
    try {
      String token = "Bearer " + LocalDBUtils.getJWTToken();
      Map<String, dynamic> res =
          await HttpHelper.post(AppUrls.addReportsUrl, body: {
        'videoid': id,
        'description': description,
      }, headers: {
        "Authorization": "$token",
      });
      if (res == null) return;
      if (res.isEmpty) return;
      print(res);
      this._fromJson(res);
    } catch (e, t) {}
  }
}

class Data {
  String sucess;

  Data({this.sucess});

  Data.fromJson(Map<String, dynamic> json) {
    sucess = json['sucess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sucess'] = this.sucess;
    return data;
  }
}
