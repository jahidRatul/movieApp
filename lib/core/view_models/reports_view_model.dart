import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/add_reports_model.dart';

class ReportsViewModel extends GetxController {
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

  getAddReportsMethod({
    String id,
    String description,
  }) async {
    try {
      await addReportsModel.callApi(id: id, description: description);
      update();
    } catch (e, t) {
      print(e);
    }
  }

  AddReportsModel addReportsModel = AddReportsModel();
}
