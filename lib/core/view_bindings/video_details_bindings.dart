import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/home_categories_model.dart';
import 'package:iotflixcinema/core/view_models/VideoDetailsViewModel.dart';
import 'package:iotflixcinema/core/view_models/categories_view_model.dart';
import 'package:iotflixcinema/core/view_models/fevorite_view_model.dart';
import 'package:iotflixcinema/core/view_models/reports_view_model.dart';
import 'package:iotflixcinema/core/view_models/video_view_view_model.dart';

class VideoDetailsBindings extends Bindings {
  VideoDetailsBindings(this.initialData);

  @override
  void dependencies() {
    // TODO: implement dependencies
    print("dependencies \n ${initialData?.title}");
    Get.put(VideoDetailsViewModel(this.initialData));
    //  Get.create(()=>VideoDetailsViewModel(this.initialData));
    Get.put(ReportsViewModel());
    Get.put(FavoriteViewModel());
    Get.put(CategoriesViewModel());
    Get.lazyPut(() => VideoViewViewModel());

    //  Get.create(()=>VideoDetailsViewModel(this.initialData));
    // Get.put(VideoDetailsViewModel());
  }

  final HomeData initialData;
}
