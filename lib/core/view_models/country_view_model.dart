import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/country_model.dart';

class CountryViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCountryMethod();
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

  Rx<CountryModel> countryModelRx = CountryModel().obs;

  CountryModel countryModel = CountryModel();

  getCountryMethod() async {
    try {
      CountryModel temp = CountryModel();
      await temp.callApi();
      countryModelRx.value = temp;
      print("data ----");
      print(countryModelRx.value?.data?.length);

      update();
    } catch (e, t) {}
  }

// All videos selected country
//   getCountryAllMoviesMethod({String id}) async {
//     try {
//       CountryAllMoviesModel tempModel = CountryAllMoviesModel();
//       await tempModel.callApi(id: id);
//       countryAllMoviesModel = tempModel;
//       update();
//     } catch (e, t) {}
//   }
//
//   CountryAllMoviesModel countryAllMoviesModel = CountryAllMoviesModel();
}
