import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/models/tv_series_seasons_model.dart';
import 'package:iotflixcinema/core/utils/local_auth/local_auth_get_storage.dart';
import 'package:iotflixcinema/core/utils/toast/flutter_toast.dart';
import 'package:iotflixcinema/core/view_models/VideoDetailsViewModel.dart';
import 'package:iotflixcinema/core/view_models/fevorite_view_model.dart';
import 'package:iotflixcinema/core/view_models/reports_view_model.dart';
import 'package:iotflixcinema/core/view_models/tv_series_view_model.dart';
import 'package:iotflixcinema/view/cards/cast/cast_car_tv_series.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/custom/read_more/read_more.dart';
import 'package:iotflixcinema/view/pages/tv_series_video_details/season/episod_bottom_sheet.dart';
import 'package:iotflixcinema/view/pages/tv_series_video_details/season/season_bottom_sheet.dart';
import 'package:iotflixcinema/view/pages/tv_series_video_details/season_video_card.dart';
import 'package:iotflixcinema/view/pages/tv_series_video_details/tv_series_info_card.dart';
import 'package:iotflixcinema/view/pages/video_details/vedio_player/vedio_player_view.dart';
import 'package:iotflixcinema/view/router/app_router.dart';
import 'package:iotflixcinema/view/widgets/round_border_button.dart';

class TvSeriesVideoDetailsPage extends StatefulWidget {
  final Episodes episodes;
  final String seriesName;
  final String seasonTitle;
  final int nestedId;

  TvSeriesVideoDetailsPage(
      {this.episodes, this.seriesName, this.seasonTitle, this.nestedId});

  @override
  _TvSeriesVideoDetailsPageState createState() =>
      _TvSeriesVideoDetailsPageState();
}

class _TvSeriesVideoDetailsPageState extends State<TvSeriesVideoDetailsPage> {
  String dropdownValue = '01';
  double _animatedHeight = 0;
  bool makeReport = false;
  TextEditingController reportText = TextEditingController();
  TvSeriesViewModel tvSeriesController = Get.put(TvSeriesViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    disableEpisode = true;
    episodeNo = "--";
    tvSeriesController.getTvSeriesSeasonEpisodeMethode(
        type: "normal",
        seasonid: widget.episodes.tvSeriesSeasonId,
        episode: widget.episodes.tvSeriesEpisodeNo);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    reportText.text;
  }

  String editableText;

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      //   backgroundColor: AppColors.pageBackground,
      body: GetBuilder<TvSeriesViewModel>(
        builder: (tvSeriesBuilderController) => Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    VideoPlayerView(
                      nestedId: widget?.nestedId,
                      model: widget?.episodes,
                      videoUrl: widget.episodes?.videoUrl,
                      thumbnailUrl: (widget?.episodes?.thumbnail == null
                          ? 'https://picsum.photos/90'
                          : AppUrls.imageBaseUrl + widget?.episodes?.thumbnail),
                    ),
                    InkWell(
                      onTap: () {
                        AppRouter.back(nestedId: widget?.nestedId);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 30),
                        child: ImageIcon(
                          AssetImage('images/backIcon.png'),
                          size: 20,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Column(
                    children: [
                      GetBuilder<VideoDetailsViewModel>(
                        builder: (videoDetailsController) => TvSeriesInfoCard(
                          imgPath: widget?.episodes?.thumbnail == null
                              ? "https://picsum.photos/60"
                              : AppUrls.imageBaseUrl +
                                  widget?.episodes?.thumbnail,
                          movieName:
                              '${widget?.seriesName} | ${widget?.seasonTitle}',
                          episodeTitle: widget?.episodes?.title,
                          movieType: 'TV-Series',
                          language: 'Spanish',
                          resolution: videoDetailsController?.videoDetailsModel
                              ?.data?.video?.videoResolution?.name,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ReadMoreText(
                          widget?.episodes?.description ?? "About this Episode",
                          textStyle: TextStyle(
                            color: Theme.of(context).textTheme.headline1.color,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GetBuilder<VideoDetailsViewModel>(
                        builder: (videoDetailsController) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      makeReport = !makeReport;
                                      makeReport
                                          ? _animatedHeight = 165.0
                                          : _animatedHeight = 0;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      ImageIcon(
                                        AssetImage('images/reportVid.png'),
                                        color: makeReport
                                            ? AppColors.ShadowRed
                                            : AppColors.borderColor,
                                        size: 22,
                                      ),
                                      Text(
                                        'Report',
                                        style: TextStyle(
                                            color: makeReport
                                                ? AppColors.ShadowRed
                                                : AppColors.borderColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    ImageIcon(
                                      AssetImage('images/shareIcon.png'),
                                      color: AppColors.borderColor,
                                      size: 22,
                                    ),
                                    Text(
                                      'Share',
                                      style: TextStyle(
                                          color: AppColors.borderColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: GetBuilder<FavoriteViewModel>(
                                  builder: (c) {
                                    c?.setFavorite(widget.episodes.id);
                                    return GestureDetector(
                                      onTap: () {
                                        if (c.isFavorite == false) {
                                          c.addFavoriteData(
                                            widget.episodes.id.toString(),
                                            context,
                                          );
                                        } else {
                                          c.deleteFavoriteData(
                                              widget.episodes.id?.toString());
                                        }
                                      },
                                      child: Column(
                                        children: [
                                          ImageIcon(
                                            AssetImage('images/loveIcon.png'),
                                            color: c?.isFavorite == true
                                                ? AppColors.red
                                                : AppColors.borderColor,
                                            size: 22,
                                          ),
                                          Text(
                                            'Favorite',
                                            style: TextStyle(
                                                color: c.isFavorite == true
                                                    ? AppColors.red
                                                    : AppColors.borderColor,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: LocalDBUtils.getJWTToken() == null
                                      ? () {}
                                      : () async {
                                          await videoDetailsController
                                              .getLikeVideoMethod(
                                                  videoId:
                                                      videoDetailsController
                                                          ?.initialData?.id);
                                          videoDetailsController
                                              .refreshLikeData(
                                                  videoDetailsController
                                                      ?.initialData);
                                        },
                                  child: Column(
                                    children: [
                                      ImageIcon(
                                        AssetImage('images/likeIcon.png'),
                                        color: videoDetailsController
                                                    ?.videoDetailsModel
                                                    ?.data
                                                    ?.video
                                                    ?.userLike ==
                                                1
                                            ? AppColors.red
                                            : AppColors.borderColor,
                                        size: 22,
                                      ),
                                      Text(
                                        videoDetailsController
                                                ?.videoDetailsModel
                                                ?.data
                                                ?.video
                                                ?.like
                                                ?.toString() ??
                                            "0",
                                        style: TextStyle(
                                            color: videoDetailsController
                                                        ?.videoDetailsModel
                                                        ?.data
                                                        ?.video
                                                        ?.userLike ==
                                                    1
                                                ? AppColors.red
                                                : AppColors.borderColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: LocalDBUtils.getJWTToken() == null
                                      ? () {}
                                      : () async {
                                          await videoDetailsController
                                              .getDislikeVideoMethod(
                                                  videoId:
                                                      videoDetailsController
                                                          ?.initialData?.id);
                                          videoDetailsController
                                              .refreshLikeData(
                                                  videoDetailsController
                                                      ?.initialData);
                                        },
                                  child: Column(
                                    children: [
                                      ImageIcon(
                                        AssetImage('images/dislikeIcon.png'),
                                        color: videoDetailsController
                                                    ?.videoDetailsModel
                                                    ?.data
                                                    ?.video
                                                    ?.userDislike ==
                                                1
                                            ? AppColors.red
                                            : AppColors.borderColor,
                                        size: 22,
                                      ),
                                      Text(
                                        videoDetailsController
                                                ?.videoDetailsModel
                                                ?.data
                                                ?.video
                                                ?.dislike
                                                ?.toString() ??
                                            "0",
                                        style: TextStyle(
                                            color: videoDetailsController
                                                        ?.videoDetailsModel
                                                        ?.data
                                                        ?.video
                                                        ?.userDislike ==
                                                    1
                                                ? AppColors.red
                                                : AppColors.borderColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        height: 5,
                        thickness: .5,
                        color: AppColors.dividerColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        height: _animatedHeight,
                        child: GetBuilder<ReportsViewModel>(
                          builder: (controller) => SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  'Let us know if you having issue with watching video',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .color,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                          color: AppColors.searchBorderColor),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          cursorColor:
                                              AppColors.textFieldTextColor,
                                          maxLines: 2,
                                          controller: reportText,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  AppColors.textFieldTextColor,
                                              fontWeight: FontWeight.bold),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            isDense: true,
                                            contentPadding: EdgeInsets.only(
                                                left: 20, top: 0, bottom: 8),
                                            hintText: 'Report details here',
                                            hintStyle: TextStyle(
                                                fontSize: 9,
                                                color: AppColors
                                                    .textFieldTextColor,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: wp(80),
                                  child: RoundBoarderButton(
                                    text: 'SUBMIT',
                                    padding: 0,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 4),
                                    onPress: () async {
                                      if (reportText.text != null &&
                                          reportText.text != '') {
                                        await controller.getAddReportsMethod(
                                            id: widget.episodes.id.toString(),
                                            description: reportText.text);
                                        if (controller.addReportsModel.status ==
                                            true) {
                                          FlutterToast.showSuccess(
                                              message: "Reported Successfully",
                                              context: context);
                                        }
                                      }

                                      setState(() {
                                        reportText.clear();
                                        _animatedHeight = 0;
                                        makeReport = false;
                                      });
                                    },
                                  ),
                                ),
                                Divider(
                                  height: 5,
                                  thickness: .5,
                                  color: AppColors.dividerColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Episode Video',
                          style: TextStyle(
                            fontFamily: 'poppins_bold',
                            fontSize: 14,
                            color: Theme.of(context).textTheme.headline1.color,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  BottomSheetSeason.bottomSheetPro(
                                    context: context,
                                    seasons: tvSeriesController
                                        .tvSeriesSeasonsModel.data.seasons,
                                  );
                                },
                                child: Container(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Season: ',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                .color,
                                          ),
                                        ),
                                        Text(
                                          tvSeriesBuilderController
                                                      .tvSeriesSeasonEpisodeModel
                                                      .data ==
                                                  null
                                              ? "--"
                                              : tvSeriesBuilderController
                                                      ?.tvSeriesSeasonEpisodeModel
                                                      ?.data
                                                      ?.first
                                                      ?.id
                                                      .toString() ??
                                                  "0",
                                          // widget.episodes.tvSeriesSeasonId < 9
                                          //     ? "0" +
                                          //             widget?.episodes
                                          //                 ?.tvSeriesSeasonId
                                          //                 ?.toString() ??
                                          //         "0"
                                          //     : widget?.episodes
                                          //             ?.tvSeriesSeasonId
                                          //             ?.toString() ??
                                          //         "0",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.ShadowRed,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: AppColors.ShadowRed,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              AbsorbPointer(
                                absorbing: disableEpisode,
                                child: GestureDetector(
                                  onTap: () {
                                    BottomSheetEpisode.bottomSheetPro(
                                      context: context,
                                      episodes: tvSeriesController
                                              ?.tvSeriesSeasonsModel
                                              ?.data
                                              ?.seasons[tvSeriesBuilderController
                                                      .tvSeriesSeasonEpisodeModel
                                                      .data
                                                      .first
                                                      .id -
                                                  1]
                                              ?.episodes ??
                                          "--",
                                    );
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Episode: ',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headline1
                                                  .color,
                                            ),
                                          ),
                                          Text(
                                            episodeNo,
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.ShadowRed,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: AppColors.ShadowRed,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, top: 10, bottom: 5),
                            child: GestureDetector(
                              onTap: () {
                                AppRouter.navToTvSeriesCategoryPage(
                                    nestedId: widget.nestedId);
                              },
                              child: Text(
                                'More',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: Color(0xffE15050)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GetBuilder<VideoDetailsViewModel>(
                        builder: (videoDetailsController) => Container(
                          height: wp(50) * (4 / 5),
                          child: ListView.builder(
                            padding: EdgeInsets.all(10),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: tvSeriesBuilderController
                                    ?.tvSeriesSeasonEpisodeModel
                                    ?.data
                                    ?.first
                                    ?.episodes
                                    ?.length ??
                                0,
                            itemBuilder: (BuildContext context, int index) =>
                                SeasonVideoCard(
                              index: tvSeriesBuilderController
                                      ?.tvSeriesSeasonEpisodeModel
                                      ?.data
                                      ?.first
                                      ?.episodes[index]
                                      .tvSeriesEpisodeNo ??
                                  0,
                              title: tvSeriesBuilderController
                                      ?.tvSeriesSeasonEpisodeModel
                                      ?.data
                                      ?.first
                                      ?.episodes[index]
                                      ?.title ??
                                  " Title",
                              imgPath: tvSeriesBuilderController
                                  ?.tvSeriesSeasonEpisodeModel
                                  ?.data
                                  ?.first
                                  ?.episodes[index]
                                  ?.thumbnail,
                              onTap: () {
                                AppRouter.navToTvSeriesVideoDetailsPage(
                                  tvSeriesBuilderController
                                      ?.tvSeriesSeasonEpisodeModel
                                      ?.data
                                      ?.first
                                      ?.episodes[index],
                                  seriesName:
                                      widget?.seriesName ?? " Series Name",
                                  seasonTitle: tvSeriesBuilderController
                                          ?.tvSeriesSeasonEpisodeModel
                                          ?.data
                                          ?.first
                                          ?.season ??
                                      ' Season Title',
                                  episodes: tvSeriesBuilderController
                                      ?.tvSeriesSeasonEpisodeModel
                                      ?.data
                                      ?.first
                                      ?.episodes[index],
                                  nestedId: widget.nestedId,
                                );
                                videoDetailsController.refreshData(
                                    tvSeriesBuilderController
                                        ?.tvSeriesSeasonEpisodeModel
                                        ?.data
                                        ?.first
                                        ?.episodes[index]);
                                // Episodes t = Episodes(
                                //     id: 1,
                                //     thumbnail: "https://picsum.photos/200",
                                //     title: " Title",
                                //     description: "working");
                                // AppRouter.navToTvSeriesVideoDetailsPage(
                                //     seriesName: 'my Series',
                                //     seasonTitle: "my title",
                                //     episodes: t);
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 8,
                        thickness: .5,
                        color: AppColors.dividerColor,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CastCardTvSeries(
                        actors: widget.episodes.actors,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
