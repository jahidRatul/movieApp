import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/home_categories_model.dart';
import 'package:iotflixcinema/core/view_models/VideoDetailsViewModel.dart';
import 'package:iotflixcinema/core/view_models/categories_view_model.dart';
import 'package:iotflixcinema/core/view_models/fevorite_view_model.dart';
import 'package:iotflixcinema/core/view_models/reports_view_model.dart';
import 'package:iotflixcinema/core/view_models/tv_series_view_model.dart';
import 'package:iotflixcinema/core/view_models/video_view_view_model.dart';

class TvSeriesVideoDetailsBindings extends Bindings {
  TvSeriesVideoDetailsBindings(this.initialData);

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ReportsViewModel());
    Get.put(TvSeriesViewModel());
    Get.lazyPut(() => VideoViewViewModel());
    Get.put(VideoDetailsViewModel(this.initialData));

    Get.put(FavoriteViewModel());
    Get.put(CategoriesViewModel());
  }

  final HomeData initialData;
}
