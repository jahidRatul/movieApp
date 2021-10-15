import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/view_models/actor_view_model.dart';
import 'package:iotflixcinema/core/view_models/categories_view_model.dart';
import 'package:iotflixcinema/core/view_models/country_view_model.dart';
import 'package:iotflixcinema/core/view_models/genre_view_model.dart';
import 'package:iotflixcinema/core/view_models/sponsor_view_model.dart';
import 'package:iotflixcinema/core/view_models/tv_series_view_model.dart';
import 'package:iotflixcinema/view/cards/app_bars/app_bar_with_title.dart';
import 'package:iotflixcinema/view/icons/explore_icons_icons.dart';
import 'package:iotflixcinema/view/pages/dashboard/cards/sponsored_movie_card.dart';
import 'package:iotflixcinema/view/pages/explore/grid_view/app_child_delegate.dart';
import 'package:iotflixcinema/view/pages/explore/grid_view/app_grid_view_delegate.dart';
import 'package:iotflixcinema/view/pages/genre/card/genre_card.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/router/app_router.dart';
import 'package:iotflixcinema/view/widgets/custom_drawer.dart';

import '../base_screen.dart';
import 'explore_page_card/explore_catagory_card.dart';
import 'explore_page_card/live_tv_ard.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends BaseScreen<ExplorePage> {
  ActorViewModel actorController = Get.put(ActorViewModel());
  GenreViewModel genreController = Get.put(GenreViewModel());
  CountryViewModel countryController = Get.put(CountryViewModel());
  CategoriesViewModel categoriesViewModel = Get.put(CategoriesViewModel());
  TvSeriesViewModel tvSeriesViewModel = Get.put(TvSeriesViewModel());

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    categoriesViewModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      //  backgroundColor: AppColors.pageBackground,
      appBar: IotaAppBar.basicAppBarWithSearchIcon(),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(0),
            child: GetBuilder<CategoriesViewModel>(
              builder: (categoryController) => GridView.custom(
                padding: EdgeInsets.all(10),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: AppGridViewDelegate(
                  3,
                  secondCrossAxisCount: 1,
                  secondChildParIndex: 7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 15,
                  firstChildHeight: wp(33),
                  secondChildHeight: wp(90) * (5 / 11),
                ),
                childrenDelegate: AppChildDelegate(
                  secondChildParIndex: 7,
                  children: [
                    ExploreCategoryCard(
                      text: "COUNTRY",
                      iconData: ExploreIcons.country,
                      backgroundColor: Color(0xff6890B8),
                      imagePath: "assets/images/explore_page/country.png",
                      onTap: () {
                        countryController.getCountryMethod();
                        AppRouter.navToCountryPage(
                            nestedId: HomePageFragment.exploreNavId);
                      },
                    ),
                    ExploreCategoryCard(
                      text: "GENRE",
                      iconData: ExploreIcons.genre,
                      backgroundColor: Color(0xffE15050),
                      imagePath: "assets/images/explore_page/genre.png",
                      onTap: () {
                        genreController.getGenreMethod();
                        AppRouter.navToGenrePage(
                            nestedId: HomePageFragment.exploreNavId);
                      },
                    ),
                    ExploreCategoryCard(
                      text: "ACTOR",
                      iconData: ExploreIcons.actor,
                      backgroundColor: Color(0xffEDC33A),
                      imagePath: "assets/images/explore_page/actor.png",
                      onTap: () {
                        actorController.getActorMethod();
                        AppRouter.navToActorPage(
                            nestedId: HomePageFragment.exploreNavId);
                      },
                    ),
                    LiveTvCard(),
                    ...Iterable.generate(
                        (categoryController?.categoriesModel?.data?.length ??
                            0), (i) {
                      if (i % 6 == 0 && i < 10 && i != 0)
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 0),
                            child: GetBuilder<SponsorViewModel>(
                              builder: (cntrlr) =>
                                  cntrlr?.sponsorModel?.data == null
                                      ? Container()
                                      : SponsoredMovieCard(
                                          title: cntrlr?.sponsorModel?.data
                                                  ?.data1?.first?.title ??
                                              '',
                                          imagePath: cntrlr?.sponsorModel?.data
                                                  ?.data1?.first?.img ??
                                              '',
                                        ),
                            ),
                          ),
                        );
                      if (((i + 4) - 10) % 7 == 0)
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 0),
                            child: GetBuilder<SponsorViewModel>(
                              builder: (cntrlr) => SponsoredMovieCard(
                                title: cntrlr
                                        ?.sponsorModel?.data?.data1[0]?.title ??
                                    '',
                                imagePath: AppUrls.imageBaseUrl +
                                        cntrlr?.sponsorModel?.data?.data1[0]
                                            ?.img ??
                                    '',
                              ),
                            ),
                          ),
                        );
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, bottom: 0, top: 0),
                        child: GenrePageCard(
                          imagePath: AppUrls.imageBaseUrl +
                                  categoryController
                                      ?.categoriesModel?.data[i]?.img ??
                              "",
                          name: categoryController
                                  ?.categoriesModel?.data[i]?.name ??
                              '',
                          // imagePath: GenreNames.getItem(i),
                          // name: GenreNames.getKey(i),
                          onTap: () {
                            // if ('TV Series' ==
                            //     categoryController
                            //         ?.categoriesModel?.data[i]?.name) {
                            //   tvSeriesViewModel.callTvSeriesMethod();
                            //   AppRouter.navToTvSeriesCategoryPage(
                            //       nestedId: HomePageFragment.exploreNavId);
                            // } else {
                            categoryController.getSubCategories(
                                id: categoryController
                                    ?.categoriesModel?.data[i]?.id);

                            AppRouter.navToActionCategoryPage(
                                catName: categoryController
                                    ?.categoriesModel?.data[i]?.name,
                                catImage: AppUrls.imageBaseUrl +
                                    categoryController
                                        ?.categoriesModel?.data[i]?.img,
                                nestedId: HomePageFragment.exploreNavId);
                            // }
                          },
                        ),
                      );
                    }),
                    GenrePageCard(
                      imagePath: "https://picsum.photos/200",
                      name: "TV Series",
                      onTap: () {
                        AppRouter.navToTvSeriesCategoryPage(
                            nestedId: HomePageFragment.exploreNavId);
                      },
                    ),
                  ],
                ),
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
