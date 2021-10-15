import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';
import 'package:iotflixcinema/core/utils/local_auth/local_auth_get_storage.dart';

class LogoutModel {
  bool status;
  String msg;

  LogoutModel({this.status, this.msg});

  LogoutModel.fromJson(Map<String, dynamic> json) {
    this._fromJson(json);
  }

  _fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    return data;
  }

  Future<void> callApi() async {
    String token = "Bearer " + LocalDBUtils.getJWTToken();
    Map<String, dynamic> res = await HttpHelper.post(AppUrls.logoutUserUrl,
        headers: {"Authorization": "$token"});
    this._fromJson(res);
    print(res);
  }
}
