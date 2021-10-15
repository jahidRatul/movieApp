import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iotflixcinema/core/models/actor_model.dart';
import 'package:iotflixcinema/core/models/actors_movies_model.dart';

class ActorViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getActorMethod();
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

  getActorMethod() async {
    try {
      ActorModel temp = ActorModel();
      await temp.callApi();
      actorModel = temp;
      update();
    } catch (e, t) {}
  }

  ActorModel actorModel = ActorModel();

  getActorsMovies({int id}) async {
    ActorsMoviesModel tempModel = ActorsMoviesModel();
    await tempModel.callApi(id: id);
    actorsMoviesModel = tempModel;
    update();
  }

  ActorsMoviesModel actorsMoviesModel = ActorsMoviesModel();
}
