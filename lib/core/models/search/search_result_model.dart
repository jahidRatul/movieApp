import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';

class SearchResultModel {
  bool status;
  String appUrl;
  Data data;

  SearchResultModel({this.status, this.appUrl, this.data});

  SearchResultModel.fromJson(Map<String, dynamic> json) {
    _fromJson(json);
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

  callApi({String value}) async {
    Map<String, dynamic> body = Map();
    if (value != null) body['value'] = "$value";

    Map<String, dynamic> res = await HttpHelper.post(
      AppUrls.searchResult,
      body: body,
    );

    if (res == null) return;
    this._fromJson(res);
  }
}

class Data {
  Results results;
  List<String> keys;

  Data({this.results, this.keys});

  Data.fromJson(Map<String, dynamic> json) {
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
    keys = json['keys'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.toJson();
    }
    data['keys'] = this.keys;
    return data;
  }
}

class Results {
  List<Videos> videos;
  List<Categories> categories;
  List<Actors> actors;
  List<Countries> countries;
  List<Genres> genres;

  Results(
      {this.videos, this.categories, this.actors, this.countries, this.genres});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['videos'] != null) {
      videos = new List<Videos>();
      json['videos'].forEach((v) {
        videos.add(new Videos.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['actors'] != null) {
      actors = new List<Actors>();
      json['actors'].forEach((v) {
        actors.add(new Actors.fromJson(v));
      });
    }
    if (json['countries'] != null) {
      countries = new List<Countries>();
      json['countries'].forEach((v) {
        countries.add(new Countries.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.videos != null) {
      data['videos'] = this.videos.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.actors != null) {
      data['actors'] = this.actors.map((v) => v.toJson()).toList();
    }
    if (this.countries != null) {
      data['countries'] = this.countries.map((v) => v.toJson()).toList();
    }
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  int id;
  String name;
  String img;

  Countries({this.id, this.name, this.img});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    return data;
  }
}

class Genres {
  int id;
  String name;
  String img;

  Genres({this.id, this.name, this.img});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    return data;
  }
}

class Actors {
  int id;
  String name;
  String img;

  Actors({this.id, this.name, this.img});

  Actors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    return data;
  }
}

class Videos {
  int id;
  String name;
  String img;
  int categoryId;
  int series;

  Videos({this.id, this.name, this.img, this.categoryId, this.series});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    categoryId = json['category_id'];
    series = json['series'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['category_id'] = this.categoryId;
    data['series'] = this.series;
    return data;
  }
}

class Categories {
  int id;
  String name;
  String img;

  Categories({this.id, this.name, this.img});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    return data;
  }
}
