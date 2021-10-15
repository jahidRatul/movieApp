import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';
import 'package:iotflixcinema/core/models/tv_series_seasons_model.dart';

class TVSeriesSeasonEpisodeModel {
  int status;
  List<Data> data;

  TVSeriesSeasonEpisodeModel({this.status, this.data});

  TVSeriesSeasonEpisodeModel.fromJson(Map<String, dynamic> json) {
    this._fromJson(json);
  }

  _fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Future<void> callApi({String type, int seasonid, int episode}) async {
    try {
      Map<String, dynamic> res = await HttpHelper.post(
        AppUrls.tvSeriesSeasonEpisodeUrl,
        body: {
          "type": type,
          "seasonId": seasonid,
          "episode": episode,
        },
      );
      if (res == null) return;
      if (res.isEmpty) return;
      print(res);
      this._fromJson(res);
    } catch (e, t) {}
  }
}

class Data {
  int id;
  int tvSeriesId;
  String season;
  String img;
  String createdAt;
  String updatedAt;
  List<Episodes> episodes;

  Data(
      {this.id,
      this.tvSeriesId,
      this.season,
      this.img,
      this.createdAt,
      this.updatedAt,
      this.episodes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tvSeriesId = json['tv_series_id'];
    season = json['season'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['episodes'] != null) {
      episodes = new List<Episodes>();
      json['episodes'].forEach((v) {
        episodes.add(new Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tv_series_id'] = this.tvSeriesId;
    data['season'] = this.season;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.episodes != null) {
      data['episodes'] = this.episodes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class EpisodesData extends HomeData {
//   int id;
//   int categoryId;
//   String title;
//   String duration;
//   String videoTypeId;
//   String videoUrl;
//   String thumbnail;
//   String description;
//   int like;
//   int dislike;
//   int isSeries;
//   int commentAllow;
//   int videoDisplay;
//   dynamic tvSeriesEpisodeNo;
//   dynamic tvSeriesSeasonId;
//   String createdAt;
//   String updatedAt;
//
//   EpisodesData(
//       {this.id,
//       this.categoryId,
//       this.title,
//       this.duration,
//       this.videoTypeId,
//       this.videoUrl,
//       this.thumbnail,
//       this.description,
//       this.like,
//       this.dislike,
//       this.isSeries,
//       this.commentAllow,
//       this.videoDisplay,
//       this.tvSeriesEpisodeNo,
//       this.tvSeriesSeasonId,
//       this.createdAt,
//       this.updatedAt});
//
//   EpisodesData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categoryId = json['category_id'];
//     title = json['title'];
//     duration = json['duration'];
//     videoTypeId = json['video_type_id'];
//     videoUrl = json['video_url'];
//     thumbnail = json['thumbnail'];
//     description = json['description'];
//     like = json['like'];
//     dislike = json['dislike'];
//     isSeries = json['is_series'];
//     commentAllow = json['comment_allow'];
//     videoDisplay = json['video_display'];
//     tvSeriesEpisodeNo = json['tv_series_episode_no'];
//     tvSeriesSeasonId = json['tv_series_season_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['category_id'] = this.categoryId;
//     data['title'] = this.title;
//     data['duration'] = this.duration;
//     data['video_type_id'] = this.videoTypeId;
//     data['video_url'] = this.videoUrl;
//     data['thumbnail'] = this.thumbnail;
//     data['description'] = this.description;
//     data['like'] = this.like;
//     data['dislike'] = this.dislike;
//     data['is_series'] = this.isSeries;
//     data['comment_allow'] = this.commentAllow;
//     data['video_display'] = this.videoDisplay;
//     data['tv_series_episode_no'] = this.tvSeriesEpisodeNo;
//     data['tv_series_season_id'] = this.tvSeriesSeasonId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
