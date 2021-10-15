import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/genre_model.dart';

class GenreViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getGenreMethod();
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

  getGenreMethod() async {
    try {
      GenreModel tempModel = GenreModel();
      await tempModel?.callApi();
      genreModel = tempModel;
      update();
    } catch (e, t) {}
  }

  GenreModel genreModel = GenreModel();
}
