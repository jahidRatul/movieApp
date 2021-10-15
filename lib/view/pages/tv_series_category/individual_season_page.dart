import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/models/tv_series_seasons_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/pages/tv_series_category/individual_all_episode_card.dart';
import 'package:iotflixcinema/view/pages/tv_series_category/tv_series_sponsored_card.dart';
import 'package:iotflixcinema/view/router/app_router.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class IndividualSeasonPage extends StatefulWidget {
  final List<Episodes> episodes;
  final String seriesName;
  final String seasonTitle;
  final String seriesImg;
  final int nestedId;

  IndividualSeasonPage(
      {this.episodes,
      this.seriesName,
      this.seasonTitle,
      this.seriesImg,
      this.nestedId});

  @override
  _IndividualSeasonPageState createState() => _IndividualSeasonPageState();
}

class _IndividualSeasonPageState extends State<IndividualSeasonPage> {
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      //  backgroundColor: AppColors.pageBackground,
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
                            Colors.black.withOpacity(0.5), BlendMode.srcOver),
                        image: PCacheImage(
                            widget?.seriesImg ?? "https://picsum.photos/200"),
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
                      widget.seriesName == null
                          ? ""
                          : widget.seriesName + "\n" + widget.seasonTitle,
                      textAlign: TextAlign.center,
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
                    AppRouter.back(nestedId: widget.nestedId);
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                // physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 4 / 5,
                    mainAxisSpacing: 30),
                itemCount: widget?.episodes?.length ?? 0,
                itemBuilder: (BuildContext context, int index) =>
                    IndividualAllEpisodeCard(
                  title: widget?.episodes[index]?.title ?? 'Episode name',
                  img: widget?.episodes[index]?.thumbnail == null
                      ? 'https://picsum.photos/100'
                      : AppUrls.imageBaseUrl +
                          widget?.episodes[index]?.thumbnail,
                  onTap: () {
                    AppRouter.navToTvSeriesVideoDetailsPage(
                      widget?.episodes[index],
                      seriesName: widget?.seriesName ?? " Series Name",
                      seasonTitle: widget?.seasonTitle ?? ' Season Title',
                      episodes: widget?.episodes[index],
                      nestedId: HomePageFragment.exploreNavId,
                    );
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
    );
  }
}
