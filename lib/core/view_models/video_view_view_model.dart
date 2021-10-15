import 'package:get/get.dart';
import 'package:iotflixcinema/core/repo/vedio_view/history_add_repo.dart';

class VideoViewViewModel extends GetxController {
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

  historyAddMethod(String id) async {
    HistoryAddRepo().addToHistory(id);
  }

  deleteSingleHistory(String id) async {
    return await HistoryAddRepo().deleteHistorySingle(id);
  }
}
