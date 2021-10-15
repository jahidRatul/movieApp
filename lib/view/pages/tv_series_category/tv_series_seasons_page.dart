import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/view_models/tv_series_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/pages/tv_series_category/individual_all_season_card.dart';
import 'package:iotflixcinema/view/pages/tv_series_category/tv_series_sponsored_card.dart';
import 'package:iotflixcinema/view/router/app_router.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class TvSeriesSeasonsPage extends StatefulWidget {
  TvSeriesSeasonsPage({this.id, this.nestedId});

  final String id;
  final int nestedId;

  @override
  _TvSeriesSeasonsPageState createState() => _TvSeriesSeasonsPageState();
}

class _TvSeriesSeasonsPageState extends State<TvSeriesSeasonsPage> {
  TvSeriesViewModel tvSeriesSeasonsController = Get.put(TvSeriesViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tvSeriesSeasonsController.getTvSeriesSeasonsMethod(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      //  backgroundColor: AppColors.pageBackground,
      body: GetBuilder<TvSeriesViewModel>(
        builder: (controller) => SingleChildScrollView(
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
                              Colors.black.withOpacity(0.5), BlendMode.srcOver),
                          image: PCacheImage(
                            controller?.tvSeriesSeasonsModel?.data?.img == null
                                ? 'https://picsum.photos/100'
                                : AppUrls.imageBaseUrl +
                                    controller?.tvSeriesSeasonsModel?.data?.img,
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
                        controller?.tvSeriesSeasonsModel?.data?.name ?? " ",
                        style: TextStyle(
                            color: AppColors.white,
                            fontFamily: 'poppins_bold',
                            // fontWeight: FontWeight.bold,
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
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, top: 42),
                      child: GestureDetector(
                        onTap: () {
                          AppRouter.navToExploreSearchPage();
                        },
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  // physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 4 / 5,
                      mainAxisSpacing: 30),
                  itemCount:
                      controller?.tvSeriesSeasonsModel?.data?.seasons?.length ??
                          0,
                  itemBuilder: (BuildContext context, int index) =>
                      IndividualAllSeasonCard(
                    title: controller?.tvSeriesSeasonsModel?.data
                            ?.seasons[index]?.season ??
                        " Season no",
                    img: controller?.tvSeriesSeasonsModel?.data?.seasons[index]
                                ?.img ==
                            null
                        ? 'https://picsum.photos/100'
                        : AppUrls.imageBaseUrl +
                            controller?.tvSeriesSeasonsModel?.data
                                ?.seasons[index]?.img,
                    onTap: () {
                      AppRouter.navToIndividualSeasonPage(
                          episodes: controller?.tvSeriesSeasonsModel?.data
                              ?.seasons[index]?.episodes,
                          seriesName:
                              controller?.tvSeriesSeasonsModel?.data?.name ??
                                  " Series name",
                          seasonTitle: controller?.tvSeriesSeasonsModel?.data
                                  ?.seasons[index]?.season ??
                              'Season name',
                          seriesImg: controller?.tvSeriesSeasonsModel?.data
                                      ?.seasons[index]?.img ==
                                  null
                              ? 'https://picsum.photos/100'
                              : AppUrls.imageBaseUrl +
                                  controller?.tvSeriesSeasonsModel?.data
                                      ?.seasons[index]?.img,
                          nestedId: HomePageFragment.exploreNavId);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: TvSeriesSponsoredCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
