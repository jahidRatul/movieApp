import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/fevorite_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/pages/favorite_page/widget/FavoriteCards.dart';
import 'package:iotflixcinema/view/widgets/custom_drawer.dart';
import 'package:toast/toast.dart';

import '../base_screen.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends BaseScreen<FavoritePage> {
  int rebuild = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.search),
          ),
        ],
        bottom: PreferredSize(
          child: Container(
            color: AppColors.deepRed,
            height: .5,
          ),
          preferredSize: Size.fromHeight(1.5),
        ),
      ),*/
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                // AppRouter.navToExploreSearchPage();
              },
              child: ImageIcon(
                AssetImage('images/searchIcon.png'),
                size: 18,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          child: Container(
            color: AppColors.deepRed,
            height: .5,
          ),
          preferredSize: Size.fromHeight(1.5),
        ),
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: 10.0,
            ),
            child: GetBuilder<FavoriteViewModel>(
              builder: (c) => c?.allFavoriteModel?.value == null
                  ? Container()
                  : new ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount:
                          (c?.allFavoriteModel?.value?.data?.length ?? 0),
                      itemBuilder: (BuildContext context, int index) {
                        return FavoriteItemCard(
                          imgPath: (c?.allFavoriteModel?.value?.data[index]
                              ?.thumbnail),
                          model: c?.allFavoriteModel?.value?.data[index],
                          onDelete: () async {
                            var model = c?.allFavoriteModel?.value?.data
                                ?.removeAt(index);
                            setState(() {});

                            int res = await c
                                .deleteFavoriteData(model?.id?.toString());
                            if (res == 200) {
                              Toast.show("Favorite Data removed", context,
                                  duration: Toast.LENGTH_SHORT,
                                  gravity: Toast.BOTTOM);
                              c?.getFavoriteData();
                            }
                          },
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
  }
}
