import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/history/history_data_model.dart';

class HistoryViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHistoryData();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  getHistoryData() async {
    HistoryDataModel tempModel = HistoryDataModel();
    await tempModel?.callApi();
    historyDataModel?.value = tempModel;
  }

  Rx<HistoryDataModel> historyDataModel = HistoryDataModel().obs;
}
