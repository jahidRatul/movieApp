import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/all_videos_view_model.dart';
import 'package:iotflixcinema/core/view_models/categories_view_model.dart';
import 'package:iotflixcinema/core/view_models/fevorite_view_model.dart';
import 'package:iotflixcinema/core/view_models/filter_videos_view_model.dart';
import 'package:iotflixcinema/core/view_models/home_banner_view_model.dart';
import 'package:iotflixcinema/core/view_models/home_categories_view_model.dart';
import 'package:iotflixcinema/core/view_models/profile_view_model.dart';
import 'package:iotflixcinema/core/view_models/sponsor_view_model.dart';
import 'package:iotflixcinema/core/view_models/tv_series_view_model.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(HomeBannerViewModel());
    Get.put(SponsorViewModel());
    Get.put(AllVideosViewModel());
    Get.put(CategoriesViewModel());
    Get.put(HomeCategoriesViewModel());
    Get.put(TvSeriesViewModel());
    Get.put(ProfileViewModel());
    Get.put(FilterVideosViewModel());

    Get.lazyPut(() => FavoriteViewModel());
  }
}
