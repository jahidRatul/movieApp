import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/constant/dev/movie_constant.dart';
import 'package:iotflixcinema/view/pages/favorite_page/widget/FavoriteCards.dart';

class HomeViewModel extends GetxController {
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
    renderFavoriteWidgets();
    super.onInit();
  }

  renderFavoriteWidgets() {
    for (int i = 0; i < MovieConstant.movieList.length; i++) {
      favoriteWidgets.add(FavoriteItemCard(
        imgPath: MovieConstant.getMovie(i),
      ));
    }

    listViewWidget.value = ListView(
      padding: EdgeInsets.symmetric(horizontal: 5),
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: favoriteWidgets,
    );
  }

  Rx<Widget> listViewWidget = Rx<Widget>();

  RxList<Widget> favoriteWidgets = RxList();
}
