import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';
import 'package:iotflixcinema/core/utils/local_auth/local_auth_get_storage.dart';

class HistoryAddRepo extends GetConnect {
  addToHistory(String id) async {
    if (id == null) return;

    if (LocalDBUtils.getJWTToken() == null) return;
    String token = "Bearer " + LocalDBUtils.getJWTToken();
    print("Bearer token :- \n");
    print(token);

    Map<String, String> headers = {"Authorization": "$token"};
    Map<String, dynamic> res = await HttpHelper.post(
      AppUrls.addToHistoryUrl,
      headers: headers,
      body: {
        'video_id': "$id",
      },
    );
  }

  deleteHistorySingle(String id) async {
    if (id == null) return;

    if (LocalDBUtils.getJWTToken() == null) return;
    String token = "Bearer " + LocalDBUtils.getJWTToken();
    print("Bearer token :- \n");
    print(token);

    Map<String, String> headers = {"Authorization": "$token"};

    try {
      Response r =
          await delete(AppUrls.deleteSingleHistory + "$id", headers: headers);
      print(r?.statusCode);
      print(r?.body);
      return r?.statusCode;
    } catch (e, t) {
      print(e);
      print(t);
      return 404;
    }
  }
}
