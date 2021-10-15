import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';
import 'package:iotflixcinema/core/utils/local_auth/local_auth_get_storage.dart';

class WishListRepo extends GetConnect {
  deleteFavorite(String id) async {
    if (id == null) return;

    if (LocalDBUtils.getJWTToken() == null) return;
    String token = "Bearer " + LocalDBUtils.getJWTToken();
    print("Bearer token :- \n");
    print(token);

    Map<String, String> headers = {"Authorization": "$token"};

    try {
      Response r = await delete(
        AppUrls.wishListSingleDeleteUrl + "$id",
        headers: headers,
      );
      print(r?.statusCode);
      print(r?.body);
      return r?.statusCode;
    } catch (e, t) {
      print(e);
      print(t);
      return 404;
    }
  }

  addFavorite(String id) async {
    if (id == null) return;

    if (LocalDBUtils.getJWTToken() == null) return;
    String token = "Bearer " + LocalDBUtils.getJWTToken();
    print("Bearer token :- \n");
    print(token);

    Map<String, String> headers = {"Authorization": "$token"};

    try {
      Map<String, dynamic> r = await HttpHelper.post(
        AppUrls.addWishList,
        headers: headers,
        body: {"videoid": "$id"},
      );
      if (r == null) return 404;
      if (r['status'] == true) return 200;
      return 404;
    } catch (e, t) {
      print(e);
      print(t);
      return 404;
    }
  }
}
