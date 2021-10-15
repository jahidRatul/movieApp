import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/view_models/country_all_videos_view_model.dart';
import 'package:iotflixcinema/core/view_models/country_view_model.dart';
import 'package:iotflixcinema/core/view_models/sponsor_view_model.dart';
import 'package:iotflixcinema/view/pages/country/card/country_card.dart';
import 'package:iotflixcinema/view/pages/dashboard/cards/sponsored_movie_card.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';

import '../../../view/cards/app_bars/app_bar_with_title.dart';
import '../../../view/router/app_router.dart';

class CountryPage extends StatefulWidget {
  final int nestedId;

  CountryPage({this.nestedId});

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final CountryAllMoviesViewModel countryAllMoviesController =
      Get.put(CountryAllMoviesViewModel());

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      // backgroundColor: AppColors.pageBackground,
      appBar: IotaAppBar.appBarWithTitle(
        title: "Country",
        backButtonOnTap: () {
          AppRouter.back(nestedId: widget?.nestedId);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              GetBuilder<CountryViewModel>(
                builder: (controller) => Container(
                  // height: hp(8) *
                  //     (controller?.countryModelRx?.value?.data?.length ?? 1),
                  child: GridView.builder(
                    //  physics: BouncingScrollPhysics(),
                    shrinkWrap: true,

                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                        controller?.countryModelRx?.value?.data?.length ?? 0,

                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                      childAspectRatio: 250.0 / 250.0,
                    ),
                    itemBuilder: (_, i) => CountryCard(
                      countryFlagPath: AppUrls.imageBaseUrl +
                              controller?.countryModelRx?.value?.data[i]?.img ??
                          '',
                      countryName:
                          controller?.countryModelRx?.value?.data[i]?.title ??
                              'Country',
                      onTap: () {
                        countryAllMoviesController.getCountryAllMoviesMethod(
                            id: controller?.countryModelRx?.value?.data[i]?.id
                                .toString());
                        AppRouter.navToCountryAllMoviesPage(
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
                      imagePath: cntrlr?.sponsorModel?.data?.data1[0]?.img,
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
