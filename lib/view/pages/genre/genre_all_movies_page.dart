import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/view_models/genre_all_movies_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/pages/action_category/action_category_img_card.dart';
import 'package:iotflixcinema/view/pages/action_category/action_category_sponsored_card.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/router/app_router.dart';

class GenreAllMoviesPage extends StatefulWidget {
  final int nestedId;

  GenreAllMoviesPage({this.nestedId});

  @override
  _GenreAllMoviesPageState createState() => _GenreAllMoviesPageState();
}

class _GenreAllMoviesPageState extends State<GenreAllMoviesPage> {
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      // backgroundColor: AppColors.pageBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: hp(30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.srcOver),
                        image: AssetImage(
                          'images/jokerWide.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 2),
                            color: Colors.black38)
                      ]),
                  child: Center(
                    child: Text(
                      'Genre Movies',
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    AppRouter.back(nestedId: widget?.nestedId);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 40),
                    child: ImageIcon(
                      AssetImage('images/backIcon.png'),
                      size: 20,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      AppRouter.navToExploreSearchPage();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, top: 42),
                      child: ImageIcon(
                        AssetImage('images/searchIcon.png'),
                        size: 18,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: GetBuilder<GenreAllMoviesViewModel>(
                builder: (controller) => GridView.builder(
                  padding: EdgeInsets.zero,
                  // physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 4 / 5,
                      mainAxisSpacing: 10),
                  itemCount:
                      controller?.genreAllMoviesModel?.data?.data1?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) =>
                      ActionCategoryImgCard(
                    // imgPath: MovieConstant.getMovie(index),
                    imgPath: AppUrls.imageBaseUrl +
                            controller?.genreAllMoviesModel?.data?.data1[index]
                                ?.thumbnail ??
                        "",
                    onTap: () {
                      AppRouter.navToVideoDetailsPage(
                          controller?.genreAllMoviesModel?.data?.data1[index],
                          HomePageFragment.exploreNavId,
                          controller?.genreAllMoviesModel?.data?.data1[index]
                              ?.categoryId);
                      //    AppRouter.navToVideoDetailsPage();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ActionCategorySponsoredCard(),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            //   child: GridView.builder(
            //     padding: EdgeInsets.zero,
            //     // physics: ClampingScrollPhysics(),
            //     shrinkWrap: true,
            //     physics: NeverScrollableScrollPhysics(),
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 3,
            //         childAspectRatio: 4 / 5,
            //         mainAxisSpacing: 10),
            //     itemCount: 9,
            //     itemBuilder: (BuildContext context, int index) =>
            //         ActionCategoryImgCard(
            //       imgPath: MovieConstant.getMovie(index),
            //       onTap: () {
            //         AppRouter.navToVideoDetailsPage();
            //       },
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
