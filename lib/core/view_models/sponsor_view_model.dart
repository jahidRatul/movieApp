import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iotflixcinema/core/models/sponsor_model.dart';

class SponsorViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSponsorMethod();
  }

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

  getSponsorMethod() async {

    await sponsorModel.callApi();
    update();
  }

  SponsorModel sponsorModel = SponsorModel();
}
