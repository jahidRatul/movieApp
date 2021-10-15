import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/feedback_model.dart';

class FeedbackViewModel extends GetxController {
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  getFeedbackMethod({
    String name,
    String phone,
    String email,
    String feedback,
  }) async {
    await feedbackModel.callApi(
        phone: phone, name: name, email: email, feedback: feedback);
    update();
  }

  FeedbackModel feedbackModel = FeedbackModel();
}
