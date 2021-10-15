import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/api/http_request.dart';

class CategoriesModel {
  bool status;
  String appUrl;
  List<Data> data;

  CategoriesModel({this.status, this.appUrl, this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    this._fromJson(json);
  }

  _fromJson(Map<String, dynamic> json) {
    try {
      status = json['status'];
      appUrl = json['appUrl'];
      if (json['data'] != null) {
        data = new List<Data>();
        json['data'].forEach((v) {
          data.add(new Data.fromJson(v));
        });
      }
    } catch (e, t) {
      print(e);
      print(t);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['appUrl'] = this.appUrl;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Future<void> callApi() async {
    try {
      Map<String, dynamic> res = await HttpHelper.get(AppUrls.categoriesUrl);
      if (res == null) return;
      if (res.isEmpty) return;
      print(res);
      this._fromJson(res);
    } catch (e, t) {}
  }
}

class Data {
  int id;
  dynamic categoryId;
  int categoryTypeId;
  String name;
  String img;
  String createdAt;
  String updatedAt;
  List<Categories> categories;
  CategoryType categoryType;

  Data(
      {this.id,
      this.categoryId,
      this.categoryTypeId,
      this.name,
      this.img,
      this.createdAt,
      this.updatedAt,
      this.categories,
      this.categoryType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    categoryTypeId = json['category_type_id'];
    name = json['name'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    categoryType = json['category_type'] != null
        ? new CategoryType.fromJson(json['category_type'])
        : null;
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
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.categoryType != null) {
      data['category_type'] = this.categoryType.toJson();
    }
    return data;
  }
}

class Categories {
  int id;
  int categoryId;
  int categoryTypeId;
  String name;
  String img;
  String createdAt;
  String updatedAt;

  Categories(
      {this.id,
      this.categoryId,
      this.categoryTypeId,
      this.name,
      this.img,
      this.createdAt,
      this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
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

class CategoryType {
  int id;
  String type;
  String createdAt;
  String updatedAt;

  CategoryType({this.id, this.type, this.createdAt, this.updatedAt});

  CategoryType.fromJson(Map<String, dynamic> json) {
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
