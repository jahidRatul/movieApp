import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';

abstract class HomeData {
  int id;
  int categoryId;
  String title;
  String duration;
  String videoTypeId;
  String videoUrl;
  String thumbnail;
  String description;
  int isSeries;
  int commentAllow;
  int videoDisplay;
  dynamic tvSeriesEpisodeNo;
  dynamic tvSeriesSeasonId;
  String createdAt;
  String updatedAt;
  dynamic videoResolutionId;
  int like;
  int dislike;
}

class HomeCategoriesModel {
  bool status;
  String appUrl;
  Data data;

  HomeCategoriesModel({this.status, this.appUrl, this.data});

  HomeCategoriesModel.fromJson(Map<String, dynamic> json) {
    this._fromJson(json);
  }

  _fromJson(Map<String, dynamic> json) {
    try {
      status = json['status'];
      appUrl = json['appUrl'];
      data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    } catch (e, t) {
      print(e);
    }
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

  Future<void> callApi() async {
    try {
      Map<String, dynamic> res =
          await HttpHelper.get(AppUrls.homeCategoriesUrl);
      if (res == null) return;
      if (res.isEmpty) return;
      print(res);
      this._fromJson(res);
    } catch (e, t) {}
  }
}

class Data {
  List<Featured> featured;
  List<DontMiss> dontMiss;
  List<JustAdded> justAdded;
  List<Trending> trending;
  List<Popular> popular;

  Data({
    this.featured,
    this.dontMiss,
    this.justAdded,
    this.trending,
    this.popular,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['featured'] != null) {
      featured = new List<Featured>();
      json['featured'].forEach((v) {
        featured.add(new Featured.fromJson(v));
      });
    }
    if (json['dont_miss'] != null) {
      dontMiss = new List<DontMiss>();
      json['dont_miss'].forEach((v) {
        dontMiss.add(new DontMiss.fromJson(v));
      });
    }
    if (json['just_added'] != null) {
      justAdded = new List<JustAdded>();
      json['just_added'].forEach((v) {
        justAdded.add(new JustAdded.fromJson(v));
      });
    }
    if (json['trending'] != null) {
      trending = new List<Trending>();
      json['trending'].forEach((v) {
        trending.add(new Trending.fromJson(v));
      });
    }
    if (json['popular'] != null) {
      popular = new List<Popular>();
      json['popular'].forEach((v) {
        popular.add(new Popular.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.featured != null) {
      data['featured'] = this.featured.map((v) => v.toJson()).toList();
    }
    if (this.dontMiss != null) {
      data['dont_miss'] = this.dontMiss.map((v) => v.toJson()).toList();
    }
    if (this.justAdded != null) {
      data['just_added'] = this.justAdded.map((v) => v.toJson()).toList();
    }
    if (this.trending != null) {
      data['trending'] = this.trending.map((v) => v.toJson()).toList();
    }
    if (this.popular != null) {
      data['popular'] = this.popular.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Featured {
  int id;
  int videoId;
  String createdAt;
  String updatedAt;
  DontMiss video;

  Featured({this.id, this.videoId, this.createdAt, this.updatedAt, this.video});

  Featured.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoId = json['video_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    video = json['video'] != null ? new DontMiss.fromJson(json['video']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video_id'] = this.videoId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.video != null) {
      data['video'] = this.video.toJson();
    }
    return data;
  }
}

class DontMiss extends HomeData {
  int id;
  int categoryId;
  String title;
  String duration;
  String videoTypeId;
  String videoUrl;
  String thumbnail;
  String description;
  int isSeries;
  int commentAllow;
  int videoDisplay;
  dynamic tvSeriesEpisodeNo;
  dynamic tvSeriesSeasonId;
  String createdAt;
  String updatedAt;
  dynamic videoResolutionId;
  int like;
  int dislike;

  DontMiss(
      {this.id,
      this.categoryId,
      this.title,
      this.duration,
      this.videoTypeId,
      this.videoUrl,
      this.thumbnail,
      this.description,
      this.isSeries,
      this.commentAllow,
      this.videoDisplay,
      this.tvSeriesEpisodeNo,
      this.tvSeriesSeasonId,
      this.createdAt,
      this.updatedAt,
      this.videoResolutionId,
      this.like,
      this.dislike});

  DontMiss.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    duration = json['duration'];
    videoTypeId = json['video_type_id'];
    videoUrl = json['video_url'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    isSeries = json['is_series'];
    commentAllow = json['comment_allow'];
    videoDisplay = json['video_display'];
    tvSeriesEpisodeNo = json['tv_series_episode_no'];
    tvSeriesSeasonId = json['tv_series_season_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    videoResolutionId = json['video_resolution_id'];
    like = json['like'];
    dislike = json['dislike'];
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
    data['is_series'] = this.isSeries;
    data['comment_allow'] = this.commentAllow;
    data['video_display'] = this.videoDisplay;
    data['tv_series_episode_no'] = this.tvSeriesEpisodeNo;
    data['tv_series_season_id'] = this.tvSeriesSeasonId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['video_resolution_id'] = this.videoResolutionId;
    data['like'] = this.like;
    data['dislike'] = this.dislike;
    return data;
  }
}

class JustAdded extends HomeData {
  int id;
  int categoryId;
  String title;
  String duration;
  String videoTypeId;
  String videoUrl;
  String thumbnail;
  String description;
  int isSeries;
  int commentAllow;
  int videoDisplay;
  dynamic tvSeriesEpisodeNo;
  dynamic tvSeriesSeasonId;
  String createdAt;
  String updatedAt;
  dynamic videoResolutionId;
  int like;
  int dislike;

  JustAdded(
      {this.id,
      this.categoryId,
      this.title,
      this.duration,
      this.videoTypeId,
      this.videoUrl,
      this.thumbnail,
      this.description,
      this.isSeries,
      this.commentAllow,
      this.videoDisplay,
      this.tvSeriesEpisodeNo,
      this.tvSeriesSeasonId,
      this.createdAt,
      this.updatedAt,
      this.videoResolutionId,
      this.like,
      this.dislike});
  JustAdded.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    duration = json['duration'];
    videoTypeId = json['video_type_id'];
    videoUrl = json['video_url'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    isSeries = json['is_series'];
    commentAllow = json['comment_allow'];
    videoDisplay = json['video_display'];
    tvSeriesEpisodeNo = json['tv_series_episode_no'];
    tvSeriesSeasonId = json['tv_series_season_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    videoResolutionId = json['video_resolution_id'];
    like = json['like'];
    dislike = json['dislike'];
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
    data['is_series'] = this.isSeries;
    data['comment_allow'] = this.commentAllow;
    data['video_display'] = this.videoDisplay;
    data['tv_series_episode_no'] = this.tvSeriesEpisodeNo;
    data['tv_series_season_id'] = this.tvSeriesSeasonId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['video_resolution_id'] = this.videoResolutionId;
    data['like'] = this.like;
    data['dislike'] = this.dislike;
    return data;
  }
}

class Popular {
  int videoId;
  int views;
  DontMiss video;

  Popular({this.videoId, this.views, this.video});

  Popular.fromJson(Map<String, dynamic> json) {
    videoId = json['video_id'];
    views = json['views'];
    video = json['video'] != null ? new DontMiss.fromJson(json['video']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_id'] = this.videoId;
    data['views'] = this.views;
    if (this.video != null) {
      data['video'] = this.video.toJson();
    }
    return data;
  }
}

class Trending {
  int videoId;
  int views;
  DontMiss video;

  Trending({this.videoId, this.views, this.video});

  Trending.fromJson(Map<String, dynamic> json) {
    videoId = json['video_id'];
    views = json['views'];
    video = json['video'] != null ? new DontMiss.fromJson(json['video']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_id'] = this.videoId;
    data['views'] = this.views;
    if (this.video != null) {
      data['video'] = this.video.toJson();
    }
    return data;
  }
}
