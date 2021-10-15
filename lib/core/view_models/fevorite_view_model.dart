import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/all_favorite_data_model.dart';
import 'package:iotflixcinema/core/repo/wish_list/wish_list_repo.dart';

class FavoriteViewModel extends GetxController {
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFavoriteData();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  getFavoriteData() async {
    AllFavoriteDataModel temp = AllFavoriteDataModel();
    await temp.callApi();
    allFavoriteModel?.value = temp;

    update();
  }

  deleteFavoriteData(String id) async {
    var status = await WishListRepo()?.deleteFavorite(id);
    getFavoriteData();
    return status;
  }

  addFavoriteData(String id, BuildContext context) async {
    var status = await WishListRepo()?.addFavorite(id);
    getFavoriteData();
    //setFavorite(int.tryParse(id));
    return status;
  }

  setFavorite(int id) {
    try {
      Data d = allFavoriteModel.value?.data
          ?.firstWhere((element) => element?.id == id);
      isFavorite = d != null;

      print("isFavorite :- $isFavorite");
      update();
    } catch (e, t) {
      isFavorite = false;
    }
  }

  bool isFavorite = false;

  Rx<AllFavoriteDataModel> allFavoriteModel = AllFavoriteDataModel().obs;
}
