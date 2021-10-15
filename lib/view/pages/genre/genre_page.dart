import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/view_models/genre_all_movies_view_model.dart';
import 'package:iotflixcinema/core/view_models/genre_view_model.dart';
import 'package:iotflixcinema/core/view_models/sponsor_view_model.dart';
import 'package:iotflixcinema/view/cards/app_bars/app_bar_with_title.dart';
import 'package:iotflixcinema/view/pages/dashboard/cards/sponsored_movie_card.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/router/app_router.dart';

import 'card/genre_card.dart';

class GenrePage extends StatefulWidget {
  final int nestedId;

  GenrePage({this.nestedId});

  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  GenreAllMoviesViewModel genreMoviesController =
      Get.put(GenreAllMoviesViewModel());

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      // backgroundColor: AppColors.pageBackground,
      appBar: IotaAppBar.appBarWithTitle(
        title: "Genre",
        backButtonOnTap: () {
          AppRouter.back(nestedId: widget?.nestedId);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: GetBuilder<GenreViewModel>(
                  builder: (controller) => GridView.builder(
                    //  physics: BouncingScrollPhysics(),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // itemCount: (GenreNames.getLen()),
                    itemCount: controller?.genreModel?.data?.length ?? 0,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                      childAspectRatio: 250.0 / 250.0,
                    ),
                    itemBuilder: (_, i) => GenrePageCard(
                      imagePath: AppUrls.imageBaseUrl +
                              controller?.genreModel?.data[i]?.img ??
                          '',
                      name: controller?.genreModel?.data[i]?.name ?? 'Genre',
                      // imagePath: GenreNames.getItem(i),
                      // name: GenreNames.getKey(i),
                      onTap: () {
                        genreMoviesController?.getGenreAllMoviesMethod(
                            controller?.genreModel?.data[i]?.id.toString());
                        AppRouter.navToGenreAllMoviesPage(
                            nestedId: HomePageFragment.exploreNavId);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 160,
                child: Padding(
                  padding: const EdgeInsets.only(left: 3, right: 3),
                  child: GetBuilder<SponsorViewModel>(
                    builder: (cntrlr) => SponsoredMovieCard(
                      title: cntrlr?.sponsorModel?.data?.data1[0]?.title ?? '',
                      imagePath:
                          cntrlr?.sponsorModel?.data?.data1[0]?.img ?? "",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
