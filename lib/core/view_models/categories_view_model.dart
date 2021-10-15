import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iotflixcinema/core/models/CategoriesModel.dart';
import 'package:iotflixcinema/core/models/sub_categories_all_videos.dart';
import 'package:iotflixcinema/core/models/sub_categories_model.dart';

class CategoriesViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategories();
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

  getCategories() async {
    CategoriesModel tempModel = CategoriesModel();
    await tempModel.callApi();
    categoriesModel = tempModel;
    update();
  }

  CategoriesModel categoriesModel = CategoriesModel();

// subCategories
  getSubCategories({int id}) async {
    SubCategoriesModel tempModel = SubCategoriesModel();
    await tempModel.callApi(id: id);
    subCategoriesModel = tempModel;
    update();
  }

  SubCategoriesModel subCategoriesModel = SubCategoriesModel();

  // subCategoriesAllVideos
  getSubCategoriesAllVideos({int id}) async {
    SubCategoryAllVideosModel tempModel = SubCategoryAllVideosModel();
    await tempModel.callApi(id: id);
    subCategoryAllVideosModel = tempModel;
    update();
  }

  SubCategoryAllVideosModel subCategoryAllVideosModel =
      SubCategoryAllVideosModel();
}
