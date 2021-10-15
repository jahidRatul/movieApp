import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/genre_all_movies_model.dart';

class GenreAllMoviesViewModel extends GetxController {
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

  getGenreAllMoviesMethod(String id) async {
    try {
      await genreAllMoviesModel.callApi(id);
      update();
    } catch (e, t) {}
  }

  GenreAllMoviesModel genreAllMoviesModel = GenreAllMoviesModel();
}
