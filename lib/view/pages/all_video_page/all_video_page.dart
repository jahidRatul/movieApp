import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/view_models/all_videos_view_model.dart';
import 'package:iotflixcinema/core/view_models/sponsor_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/custom/grid_view/9_child_grid_view/nine_child_delegate.dart';
import 'package:iotflixcinema/view/custom/grid_view/9_child_grid_view/nine_child_view_delegate.dart';
import 'package:iotflixcinema/view/pages/all_video_page/cards/all_video_img_card.dart';
import 'package:iotflixcinema/view/pages/base_screen.dart';
import 'package:iotflixcinema/view/pages/dashboard/cards/sponsored_movie_card.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/router/app_router.dart';
import 'package:iotflixcinema/view/widgets/custom_drawer.dart';

import 'filter_bottom_sheet/filter_bottom_sheet.dart';

class AllVideoPage extends StatefulWidget {
  @override
  _AllVideoPageState createState() => _AllVideoPageState();
}

class _AllVideoPageState extends BaseScreen<AllVideoPage> {
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        //  backgroundColor: AppColors.appBarColor,
        bottom: PreferredSize(
            child: Container(
              color: AppColors.deepRed,
              height: 0.5,
            ),
            preferredSize: Size.fromHeight(0.0)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                AppRouter.navToExploreSearchPage(
                    nestedId: HomePageFragment.liveNavId);
              },
              child: ImageIcon(
                AssetImage('images/searchIcon.png'),
                size: 18,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await BottomSheetFilter.bottomSheetPro(context);
            },
            child: Container(
              height: 25,
              width: 25,
              margin: const EdgeInsets.only(right: 20.0, top: 16, bottom: 16),
              decoration: BoxDecoration(
                color: AppColors.ShadowRed,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Center(
                child: ImageIcon(
                  AssetImage(
                    'images/liveFilterIcon.png',
                  ),
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            GetBuilder<AllVideosViewModel>(
              builder: (controller) => GridView.custom(
                padding: EdgeInsets.symmetric(horizontal: 5),
                // physics: AlwaysScrollableScrollPhysics(),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: NineChildGridViewDelegate(
                  3,
                  secondCrossAxisCount: 1,
                  secondChildParIndex: 10,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  firstChildHeight: wp(33) + 15,
                  secondChildHeight: wp(90) * (5 / 11),
                ),
                childrenDelegate: NineChildDelegate(
                  secondChildParIndex: 5,
                  children: [
                    ...Iterable.generate(
                      controller?.allVideosModel?.data?.length ?? 0,
                      (i) {
                        if ((i + 1) % 10 == 0 && i != 0) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Container(
                              height: wp(90) * (5 / 11),
                              child: GetBuilder<SponsorViewModel>(
                                builder: (cntrlr) => Visibility(
                                  visible: (cntrlr?.sponsorModel?.data?.data1
                                              ?.length ??
                                          0) !=
                                      0,
                                  child: Container(
                                    height: wp(90) * (5 / 11),
                                    padding: const EdgeInsets.only(
                                        left: 3, right: 3),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: cntrlr?.sponsorModel?.data
                                              ?.data1?.length ??
                                          0,
                                      itemBuilder: (_, i) => SponsoredMovieCard(
                                        title: cntrlr?.sponsorModel?.data
                                                ?.data1[i]?.title ??
                                            '',
                                        imagePath: cntrlr?.sponsorModel?.data
                                                ?.data1[i]?.img ??
                                            '',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return AllVideoImgCard(
                          // imgPath: MovieConstant.getMovie(i),
                          imgPath: AppUrls.imageBaseUrl +
                              controller?.allVideosModel?.data[i]?.thumbnail,
                          onTap: () {
                            AppRouter.navToVideoDetailsPage(
                                controller?.allVideosModel?.data[i],
                                HomePageFragment.liveNavId,
                                controller?.allVideosModel?.data[i].categoryId);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
  }
}
