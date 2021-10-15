import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/all_videos_model.dart';

int maxLikeForFilter = 0;

class AllVideosViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllVideosMethod();
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

  getAllVideosMethod() async {
    AllVideosModel tempModel = AllVideosModel();

    await tempModel.callApi();
    allVideosModel = tempModel;
    maxLikeForFilter = allVideosModel?.maxLike ?? 100;
    print(maxLikeForFilter);
    update();
  }

  AllVideosModel allVideosModel = AllVideosModel();
}
