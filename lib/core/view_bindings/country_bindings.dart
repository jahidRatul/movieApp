import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/country_view_model.dart';

class CountryBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CountryViewModel());
  }
}
