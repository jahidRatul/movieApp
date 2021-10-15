import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';
import 'package:iotflixcinema/core/models/home_categories_model.dart';
import 'package:iotflixcinema/core/utils/local_auth/local_auth_get_storage.dart';

class VideoDetailsModel {
  bool status;
  String appUrl;
  Data data;

  VideoDetailsModel({this.status, this.appUrl, this.data});

  VideoDetailsModel.fromJson(Map<String, dynamic> json) {
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

  Future<void> callApi(String id) async {
    String token = "";
    if (LocalDBUtils.getJWTToken() == null) {
      token = "";
    } else {
      token = "Bearer " + LocalDBUtils.getJWTToken();
    }
    try {
      Map<String, dynamic> res = await HttpHelper.get(
        AppUrls.videoDetailsUrl + id,
        headers: {
          "Authorization": token,
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
  Video video;
  Series series;
  List<SubCats> subCats;

  Data({this.video, this.series, this.subCats});

  Data.fromJson(Map<String, dynamic> json) {
    video = json['video'] != null ? new Video.fromJson(json['video']) : null;
    series =
        json['series'] != null ? new Series.fromJson(json['series']) : null;
    if (json['subCats'] != null) {
      subCats = new List<SubCats>();
      json['subCats'].forEach((v) {
        subCats.add(new SubCats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.video != null) {
      data['video'] = this.video.toJson();
    }
    if (this.series != null) {
      data['series'] = this.series.toJson();
    }
    if (this.subCats != null) {
      data['subCats'] = this.subCats.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Video extends HomeData {
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
  String deepLink;
  VideoType videoType;
  TvSeriesSeason tvSeriesSeason;
  Category category;
  List<Countries> countries;
  List<Actors> actors;

  dynamic videoResolutionId;
  int like;
  int dislike;
  int userLike;
  int userDislike;
  int userFavorite;
  List<Genres> genres;
  VideoResolution videoResolution;

  Video({
    this.id,
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
    this.deepLink,
    this.videoType,
    this.tvSeriesSeason,
    this.category,
    this.countries,
    this.actors,
    this.dislike,
    this.genres,
    this.like,
    this.userDislike,
    this.userFavorite,
    this.userLike,
    this.videoResolutionId,
    this.videoResolution,
  });

  Video.fromJson(Map<String, dynamic> json) {
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
    deepLink = json['deep_link'];
    videoType = json['video_type'] != null
        ? new VideoType.fromJson(json['video_type'])
        : null;
    tvSeriesSeason = json['tv_series_season'] != null
        ? new TvSeriesSeason.fromJson(json['tv_series_season'])
        : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['countries'] != null) {
      countries = new List<Countries>();
      json['countries'].forEach((v) {
        countries.add(new Countries.fromJson(v));
      });
    }

    if (json['actors'] != null) {
      actors = new List<Actors>();
      json['actors'].forEach((v) {
        actors.add(new Actors.fromJson(v));
      });
    }
    dislike = json['dislike'];
    if (json['genres'] != null) {
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }
    like = json['like'];
    userDislike = json['user_dislike'];
    userFavorite = json['user_favorite'];
    userLike = json['user_like'];
    videoResolutionId = json['video_resolution_id'];
    videoResolution = json['video_resolution'] != null
        ? new VideoResolution.fromJson(json['video_resolution'])
        : null;
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
    data['deep_link'] = this.deepLink;
    if (this.videoType != null) {
      data['video_type'] = this.videoType.toJson();
    }
    if (this.tvSeriesSeason != null) {
      data['tv_series_season'] = this.tvSeriesSeason.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.countries != null) {
      data['countries'] = this.countries.map((v) => v.toJson()).toList();
    }

    if (this.actors != null) {
      data['actors'] = this.actors.map((v) => v.toJson()).toList();
    }
    data['dislike'] = this.dislike;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    data['like'] = this.like;
    data['user_dislike'] = this.userDislike;
    data['user_favorite'] = this.userFavorite;
    data['user_like'] = this.userLike;
    data['video_resolution_id'] = this.videoResolutionId;
    if (this.videoResolution != null) {
      data['video_resolution'] = this.videoResolution.toJson();
    }

    return data;
  }
}

class VideoType {
  int id;
  String type;
  String createdAt;
  String updatedAt;

  VideoType({this.id, this.type, this.createdAt, this.updatedAt});

  VideoType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TvSeriesSeason {
  int id;
  int tvSeriesId;
  String season;
  String img;
  String createdAt;
  String updatedAt;

  TvSeriesSeason(
      {this.id,
      this.tvSeriesId,
      this.season,
      this.img,
      this.createdAt,
      this.updatedAt});

  TvSeriesSeason.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tvSeriesId = json['tv_series_id'];
    season = json['season'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tv_series_id'] = this.tvSeriesId;
    data['season'] = this.season;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Category {
  int id;
  var categoryId;
  int categoryTypeId;
  String name;
  String img;
  String createdAt;
  String updatedAt;
  var category;

  Category(
      {this.id,
      this.categoryId,
      this.categoryTypeId,
      this.name,
      this.img,
      this.createdAt,
      this.updatedAt,
      this.category});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    categoryTypeId = json['category_type_id'];
    name = json['name'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['category_type_id'] = this.categoryTypeId;
    data['name'] = this.name;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category'] = this.category;
    return data;
  }
}

class Countries {
  int id;
  String title;
  String url;
  String img;
  String createdAt;
  String updatedAt;
  Pivot pivot;

  Countries(
      {this.id,
      this.title,
      this.url,
      this.img,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
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
  int countryId;
  int actorId;
  String createdAt;
  String updatedAt;

  Pivot(
      {this.videoId,
      this.countryId,
      this.actorId,
      this.createdAt,
      this.updatedAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    videoId = json['video_id'];
    countryId = json['country_id'];
    actorId = json['actor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_id'] = this.videoId;
    data['country_id'] = this.countryId;
    data['actor_id'] = this.actorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

class Series {
  int id;
  String name;
  String img;
  String createdAt;
  String updatedAt;
  List<Seasons> seasons;

  Series(
      {this.id,
      this.name,
      this.img,
      this.createdAt,
      this.updatedAt,
      this.seasons});

  Series.fromJson(Map<String, dynamic> json) {
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

class SubCats {
  int id;
  int categoryId;
  int categoryTypeId;
  String name;
  String img;
  String createdAt;
  String updatedAt;

  SubCats(
      {this.id,
      this.categoryId,
      this.categoryTypeId,
      this.name,
      this.img,
      this.createdAt,
      this.updatedAt});

  SubCats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    categoryTypeId = json['category_type_id'];
    name = json['name'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['category_type_id'] = this.categoryTypeId;
    data['name'] = this.name;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

  Seasons(
      {this.id,
      this.tvSeriesId,
      this.season,
      this.img,
      this.createdAt,
      this.updatedAt});

  Seasons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tvSeriesId = json['tv_series_id'];
    season = json['season'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tv_series_id'] = this.tvSeriesId;
    data['season'] = this.season;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Genres {
  int id;
  String name;
  String img;
  String createdAt;
  String updatedAt;
  Pivot pivot;

  Genres(
      {this.id,
      this.name,
      this.img,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Genres.fromJson(Map<String, dynamic> json) {
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

class VideoResolution {
  int id;
  int name;
  String createdAt;
  String updatedAt;

  VideoResolution({this.id, this.name, this.createdAt, this.updatedAt});

  VideoResolution.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
