import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/country_All_videos_model.dart';

class CountryAllMoviesViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  getCountryAllMoviesMethod({String id}) async {
    try {
      CountryAllMoviesModel tempModel = CountryAllMoviesModel();
      await tempModel.callApi(id: id);
      countryAllMoviesModel = tempModel;
      update();
    } catch (e, t) {}
  }

  CountryAllMoviesModel countryAllMoviesModel = CountryAllMoviesModel();
}
