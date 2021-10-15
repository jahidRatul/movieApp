import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/feedback_view_model.dart';

class FeedbackBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(FeedbackViewModel());
  }
}
