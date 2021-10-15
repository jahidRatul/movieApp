import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';
import 'package:iotflixcinema/core/models/home_categories_model.dart';

class TvSeriesSeasonsModel {
  bool status;
  String appUrl;
  Data data;

  TvSeriesSeasonsModel({this.status, this.appUrl, this.data});

  TvSeriesSeasonsModel.fromJson(Map<String, dynamic> json) {
    this._fromJson(json);
  }

  _fromJson(Map<String, dynamic> json) {
    status = json['status'];
    appUrl = json['appUrl'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['appUrl'] = this.appUrl;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }

  Future<void> callApi({String id}) async {
    try {
      Map<String, dynamic> res =
          await HttpHelper.get(AppUrls.tvSeriesSeasonsUrl + id);
      if (res == null) return;
      if (res.isEmpty) return;
      print(res);
      this._fromJson(res);
    } catch (e, t) {}
  }
}

class Data {
  int id;
  String name;
  String img;
  String createdAt;
  String updatedAt;
  List<Seasons> seasons;

  Data(
      {this.id,
      this.name,
      this.img,
      this.createdAt,
      this.updatedAt,
      this.seasons});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['seasons'] != null) {
      seasons = new List<Seasons>();
      json['seasons'].forEach((v) {
        seasons.add(new Seasons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.seasons != null) {
      data['seasons'] = this.seasons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Seasons {
  int id;
  int tvSeriesId;
  String season;
  String img;
  String createdAt;
  String updatedAt;
  List<Episodes> episodes;

  Seasons(
      {this.id,
      this.tvSeriesId,
      this.season,
      this.img,
      this.createdAt,
      this.updatedAt,
      this.episodes});

  Seasons.fromJson(Map<String, dynamic> json) {
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

class Episodes extends HomeData {
  int id;
  int categoryId;
  String title;
  String duration;
  String videoTypeId;
  String videoUrl;
  String thumbnail;
  String description;
  int like;
  int dislike;
  int isSeries;
  int commentAllow;
  int videoDisplay;
  dynamic tvSeriesEpisodeNo;
  dynamic tvSeriesSeasonId;
  String createdAt;
  String updatedAt;
  List<Actors> actors;

  Episodes(
      {this.id,
      this.categoryId,
      this.title,
      this.duration,
      this.videoTypeId,
      this.videoUrl,
      this.thumbnail,
      this.description,
      this.like,
      this.dislike,
      this.isSeries,
      this.commentAllow,
      this.videoDisplay,
      this.tvSeriesEpisodeNo,
      this.tvSeriesSeasonId,
      this.createdAt,
      this.updatedAt,
      this.actors});

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    duration = json['duration'];
    videoTypeId = json['video_type_id'];
    videoUrl = json['video_url'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    like = json['like'];
    dislike = json['dislike'];
    isSeries = json['is_series'];
    commentAllow = json['comment_allow'];
    videoDisplay = json['video_display'];
    tvSeriesEpisodeNo = json['tv_series_episode_no'];
    tvSeriesSeasonId = json['tv_series_season_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['actors'] != null) {
      actors = new List<Actors>();
      json['actors'].forEach((v) {
        actors.add(new Actors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['duration'] = this.duration;
    data['video_type_id'] = this.videoTypeId;
    data['video_url'] = this.videoUrl;
    data['thumbnail'] = this.thumbnail;
    data['description'] = this.description;
    data['like'] = this.like;
    data['dislike'] = this.dislike;
    data['is_series'] = this.isSeries;
    data['comment_allow'] = this.commentAllow;
    data['video_display'] = this.videoDisplay;
    data['tv_series_episode_no'] = this.tvSeriesEpisodeNo;
    data['tv_series_season_id'] = this.tvSeriesSeasonId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.actors != null) {
      data['actors'] = this.actors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Actors {
  int id;
  String name;
  String img;
  String createdAt;
  String updatedAt;
  Pivot pivot;

  Actors(
      {this.id,
      this.name,
      this.img,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Actors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  int videoId;
  int actorId;
  String createdAt;
  String updatedAt;

  Pivot({this.videoId, this.actorId, this.createdAt, this.updatedAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    videoId = json['video_id'];
    actorId = json['actor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_id'] = this.videoId;
    data['actor_id'] = this.actorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
