import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/view_models/home_banner_view_model.dart';
import 'package:iotflixcinema/core/view_models/home_categories_view_model.dart';
import 'package:iotflixcinema/core/view_models/profile_view_model.dart';
import 'package:iotflixcinema/core/view_models/sponsor_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/pages/dashboard/view/trending_now.dart';
import 'package:iotflixcinema/view/pages/dashboard/view/vedio_card_view.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/router/app_router.dart';
import 'package:iotflixcinema/view/widgets/custom_drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../base_screen.dart';
import 'cards/random_movie_card.dart';
import 'cards/sponsored_movie_card.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends BaseScreen<Dashboard>
    with AutomaticKeepAliveClientMixin {
  final PageController controller =
      PageController(viewportFraction: 0.9, initialPage: 0);
  int _currentPage = 0;
  bool _needScroll = true;

  _scrollToEnd() async {
    print("${controller.position.maxScrollExtent}");
    if (_needScroll) {
      _needScroll = false;
      controller.animateTo(
        controller.position.maxScrollExtent / 2.0,
        //  controller.position.maxScrollExtent,
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
  }

  ProfileViewModel profileController = Get.put(ProfileViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chkLoggedIn();

    timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 5) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      controller?.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
    controller.addListener(() {
      print("${controller.position.pixels.sign} -->>");
    });
  }

  Timer timer;

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    timer?.cancel();
    super.dispose();
  }

  chkLoggedIn() {
    profileController.getUserProfileMethod();
  }

  bool pageSnapping = false;

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                AppRouter.navToExploreSearchPage();
              },
              child: ImageIcon(
                AssetImage('images/searchIcon.png'),
                size: 18,
              ),
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: wp(90) * (5 / 11),
              child: Center(
                child: GetBuilder<HomeBannerViewModel>(
                  builder: (cntrl) => PageView.builder(
                    controller: controller,
                    itemCount: cntrl?.homeBannerModel?.data?.length ?? 0,
                    pageSnapping: true,
                    itemBuilder: (context, index) => RandomMovieCard(
                      imgPath: AppUrls.imageBaseUrl +
                              cntrl?.homeBannerModel?.data[index]?.img ??
                          "",
                    ),
                    onPageChanged: (int index) {},
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: Container(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 6,
                  //activeIndex: 1,

                  effect: SlideEffect(
                      spacing: 8.0,
                      dotWidth: 20.0,
                      radius: 0,
                      dotHeight: 2.0,
                      dotColor: Colors.grey,
                      activeDotColor: AppColors.ShadowRed),
                ),
              ),
            ),
            // TopFeatureView(),
            GetBuilder<HomeCategoriesViewModel>(
              builder: (c) => VideoCardView(
                titleName: "Featured",
                listModel: c?.homeCategoriesModel?.data?.featured
                    ?.map((e) => e?.video)
                    ?.toList(),
                onMoreTap: () {
                  AppRouter.navToMoreVideosPage(
                      catName: "Featured",
                      catImage: c?.homeCategoriesModel?.data?.featured
                                  ?.map((e) => e?.video)
                                  ?.toList()
                                  ?.first
                                  ?.thumbnail !=
                              null
                          ? AppUrls.imageBaseUrl +
                              c?.homeCategoriesModel?.data?.featured
                                  ?.map((e) => e?.video)
                                  ?.toList()
                                  ?.first
                                  ?.thumbnail
                          : "https://picsum.photos/200",
                      homeDataList: c?.homeCategoriesModel?.data?.featured
                          ?.map((e) => e?.video)
                          ?.toList(),
                      nestedId: HomePageFragment.dashboardNavId);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GetBuilder<HomeCategoriesViewModel>(
              builder: (c) => TrendingNowView(
                listModel: c?.homeCategoriesModel?.data?.trending,
                onMoreTap: () {
                  AppRouter.navToMoreVideosPage(
                      catName: "Trending now",
                      catImage: c?.homeCategoriesModel?.data?.trending
                                  ?.map((e) => e?.video)
                                  ?.toList()
                                  ?.first
                                  ?.thumbnail !=
                              null
                          ? AppUrls.imageBaseUrl +
                              c?.homeCategoriesModel?.data?.trending
                                  ?.map((e) => e?.video)
                                  ?.toList()
                                  ?.first
                                  ?.thumbnail
                          : "https://picsum.photos/200",
                      homeDataList: c?.homeCategoriesModel?.data?.trending
                          ?.map((e) => e?.video)
                          ?.toList(),
                      nestedId: HomePageFragment.dashboardNavId);
                },
              ),
            ),
            /*   GetBuilder<HomeCategoriesViewModel>(
              builder: (c) => VideoCardView(
                titleName: "Trending",
                listModel: c?.homeCategoriesModel?.data?.trending,
                onMoreTap: () {
                  AppRouter.navToActionCategoryPage();
                },
              ),
            ),*/

            SizedBox(
              height: 40,
            ),
            Container(
              height: wp(90) * (5 / 11),
              child: GetBuilder<SponsorViewModel>(
                builder: (cntrlr) => Visibility(
                  visible:
                      (cntrlr?.sponsorModel?.data?.data1?.length ?? 0) != 0,
                  child: Container(
                    height: wp(90) * (5 / 11),
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cntrlr?.sponsorModel?.data?.data1?.length ?? 0,
                      itemBuilder: (_, i) => SponsoredMovieCard(
                        title:
                            cntrlr?.sponsorModel?.data?.data1[i]?.title ?? '',
                        imagePath:
                            cntrlr?.sponsorModel?.data?.data1[i]?.img ?? '',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GetBuilder<HomeCategoriesViewModel>(
              builder: (c) => VideoCardView(
                titleName: "Just Added",
                listModel: c?.homeCategoriesModel?.data?.justAdded,
                onMoreTap: () {
                  AppRouter.navToMoreVideosPage(
                      catName: "Just Added",
                      catImage: c?.homeCategoriesModel?.data?.justAdded?.first
                                  ?.thumbnail !=
                              null
                          ? AppUrls.imageBaseUrl +
                              c?.homeCategoriesModel?.data?.justAdded?.first
                                  ?.thumbnail
                          : "https://picsum.photos/200",
                      homeDataList: c?.homeCategoriesModel?.data?.justAdded,
                      nestedId: HomePageFragment.dashboardNavId);
                },
              ),
            ),
            GetBuilder<HomeCategoriesViewModel>(
              builder: (c) => VideoCardView(
                titleName: "Don't Miss",
                listModel: c?.homeCategoriesModel?.data?.dontMiss,
                onMoreTap: () {
                  AppRouter.navToMoreVideosPage(
                      catName: "Don't Miss",
                      catImage: c?.homeCategoriesModel?.data?.dontMiss?.first
                                  ?.thumbnail !=
                              null
                          ? AppUrls.imageBaseUrl +
                              c?.homeCategoriesModel?.data?.dontMiss?.first
                                  ?.thumbnail
                          : "https://picsum.photos/200",
                      homeDataList: c?.homeCategoriesModel?.data?.dontMiss,
                      nestedId: HomePageFragment.dashboardNavId);
                },
              ),
            ),

            GetBuilder<HomeCategoriesViewModel>(
              builder: (c) => VideoCardView(
                titleName: "Popular",
                listModel: c?.homeCategoriesModel?.data?.popular
                    ?.map((e) => e?.video)
                    ?.toList(),
                onMoreTap: () {
                  AppRouter.navToMoreVideosPage(
                      catName: "Popular",
                      catImage: c?.homeCategoriesModel?.data?.popular
                                  ?.map((e) => e?.video)
                                  ?.toList()
                                  ?.first
                                  ?.thumbnail !=
                              null
                          ? AppUrls.imageBaseUrl +
                              c?.homeCategoriesModel?.data?.popular
                                  ?.map((e) => e?.video)
                                  ?.toList()
                                  ?.first
                                  ?.thumbnail
                          : "https://picsum.photos/200",
                      homeDataList: c?.homeCategoriesModel?.data?.popular
                          ?.map((e) => e?.video)
                          ?.toList(),
                      nestedId: HomePageFragment.dashboardNavId);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void afterFirstLayout(BuildContext context) {
    print("list :- ");
    /* print(
        "list :-${RouterState.getRouteList(HomePageFragment.dashboardNavId)?.length} ");

    RouterState.getRouteList(HomePageFragment.dashboardNavId)
        .forEach((element) {
      print("$element");
      Get.toNamed(
        element,
        id: HomePageFragment.dashboardNavId,
      );
    });*/
  }
}
