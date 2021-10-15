import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/category_maylike_model.dart';
import 'package:iotflixcinema/core/models/home_categories_model.dart';
import 'package:iotflixcinema/core/models/like_dislike_model.dart';
import 'package:iotflixcinema/core/models/video_details_model.dart';

class VideoDetailsViewModel extends GetxController {
  VideoDetailsViewModel(this.initialData);
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
    getVideoDetailsMethod(initialData?.id?.toString(), initialData?.categoryId);
    // getVideoDetailsMethod("5");
    super.onInit();
    print("onInit getVideoDetailsMethod");
  }

  VideoDetailsModel videoDetailsModel = VideoDetailsModel();

  getVideoDetailsMethod(String id, int catId) async {
    await videoDetailsModel.callApi(id);
    update();
    await categoryMaylikeModel.callApi(id: catId);
    update();
  }

  refreshData(HomeData initialData) async {
    this.initialData = initialData;
    getCategoryMaylike(id: initialData.categoryId);
    update();
    await videoDetailsModel.callApi(initialData.id.toString());
    update();
  }

  refreshLikeData(HomeData initialData) async {
    this.initialData = initialData;

    await videoDetailsModel.callApi(initialData.id.toString());

    update();
    print(
        "like ---------------------------- ${videoDetailsModel.data.video.like}");
  }

  HomeData initialData;

  getCategoryMaylike({int id}) async {
    CategoryMaylikeModel tempModel = CategoryMaylikeModel();
    await tempModel.callApi(id: id);
    categoryMaylikeModel = tempModel;
    update();
  }

  CategoryMaylikeModel categoryMaylikeModel = CategoryMaylikeModel();

  getLikeVideoMethod({int videoId}) async {
    LikeDislikeModel tempModel = LikeDislikeModel();
    await tempModel.callLikeApi(videoId: videoId);
    likeDislikeModel = tempModel;

    update();
  }

  getDislikeVideoMethod({int videoId}) async {
    LikeDislikeModel tempModel = LikeDislikeModel();
    await tempModel.callDislikeApi(videoId: videoId);
    likeDislikeModel = tempModel;

    update();
  }

  LikeDislikeModel likeDislikeModel = LikeDislikeModel();
}
