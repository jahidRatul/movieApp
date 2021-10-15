import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/genre_view_model.dart';

class GenrePageBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(GenreViewModel());
  }
}
