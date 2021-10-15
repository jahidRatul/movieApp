import 'package:get_storage/get_storage.dart';
import 'package:iotflixcinema/core/constant/storage_constant.dart';

class LocalDBUtils {
  static saveJWTToken(String token) {
    GetStorage getStorage = GetStorage(StorageConstant.authStorage);
    getStorage.write(StorageConstant.jwtToken, token);
  }

  static String getJWTToken() {
    GetStorage getStorage = GetStorage(StorageConstant.authStorage);
    return getStorage.read(StorageConstant.jwtToken);
  }

  static void deleteJWTToken() {
    GetStorage getStorage = GetStorage(StorageConstant.authStorage);
    getStorage.remove(StorageConstant.jwtToken);
  }
}

// import 'package:get_storage/get_storage.dart';
// import 'package:shop_app/core/constant/storage_constant.dart';
//
// class LocalDBUtils {
//   static saveJwtToken(String token) {
//     GetStorage g = GetStorage(StorageConstant.authInitial);
//     g.write(StorageConstant.jwtToken, token);
//   }
//
//   static getJwtToken() {
//     GetStorage g = GetStorage(StorageConstant.authInitial);
//     return g.read(StorageConstant.jwtToken);
//   }
// }
