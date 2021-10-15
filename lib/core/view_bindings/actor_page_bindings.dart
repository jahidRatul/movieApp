import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/actor_view_model.dart';

class ActorPageBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ActorViewModel());
  }
}
