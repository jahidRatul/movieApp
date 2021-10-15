import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/tv_series_model.dart';
import 'package:iotflixcinema/core/models/tv_series_season_episode_model.dart';
import 'package:iotflixcinema/core/models/tv_series_seasons_model.dart';

class TvSeriesViewModel extends GetxController {
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
    super.onInit();
    callTvSeriesMethod();
  }

  callTvSeriesMethod() async {
    await tvSeriesModel.callApi();
    update();
  }

  getTvSeriesSeasonsMethod({String id}) async {
    TvSeriesSeasonsModel temp = TvSeriesSeasonsModel();
    await temp?.callApi(id: id);
    tvSeriesSeasonsModel = temp;
    update();
  }

  TvSeriesSeasonsModel tvSeriesSeasonsModel = TvSeriesSeasonsModel();

  TvSeriesModel tvSeriesModel = TvSeriesModel();

  ////
  getTvSeriesSeasonEpisodeMethode({
    String type,
    int seasonid,
    int episode,
  }) async {
    TVSeriesSeasonEpisodeModel tempModel = TVSeriesSeasonEpisodeModel();
    await tempModel.callApi(
      episode: episode,
      seasonid: seasonid,
      type: type,
    );
    tvSeriesSeasonEpisodeModel = tempModel;
    update();
  }

  TVSeriesSeasonEpisodeModel tvSeriesSeasonEpisodeModel =
      TVSeriesSeasonEpisodeModel();
}
