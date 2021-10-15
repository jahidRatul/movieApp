import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';
import 'package:iotflixcinema/core/utils/local_auth/local_auth_get_storage.dart';

class LikeDislikeModel {
  int status;
  String message;

  LikeDislikeModel({this.status, this.message});

  LikeDislikeModel.fromJson(Map<String, dynamic> json) {
    this._fromJson(json);
  }

  _fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }

  Future<void> callLikeApi({int videoId}) async {
    String token = "Bearer " + LocalDBUtils.getJWTToken();
    try {
      Map<String, dynamic> res = await HttpHelper.post(
        AppUrls.likeUrl,
        body: {
          "videoid": videoId,
        },
        headers: {
          "Authorization": token,
        },
      );
      if (res == null) return;
      if (res.isEmpty) return;
      print(res);
      this._fromJson(res);
    } catch (e, t) {}
  }

  Future<void> callDislikeApi({int videoId}) async {
    String token = "Bearer " + LocalDBUtils.getJWTToken();
    try {
      Map<String, dynamic> res = await HttpHelper.post(
        AppUrls.dislikeUrl,
        body: {
          "videoid": videoId,
        },
        headers: {
          "Authorization": token,
        },
      );
      if (res == null) return;
      if (res.isEmpty) return;
      print(res);
      this._fromJson(res);
    } catch (e, t) {}
  }
}
