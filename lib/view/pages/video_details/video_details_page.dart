import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/utils/local_auth/local_auth_get_storage.dart';
import 'package:iotflixcinema/core/utils/toast/flutter_toast.dart';
import 'package:iotflixcinema/core/view_models/VideoDetailsViewModel.dart';
import 'package:iotflixcinema/core/view_models/categories_view_model.dart';
import 'package:iotflixcinema/core/view_models/fevorite_view_model.dart';
import 'package:iotflixcinema/core/view_models/reports_view_model.dart';
import 'package:iotflixcinema/view/cards/cast/cast_card.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/custom/read_more/read_more.dart';
import 'package:iotflixcinema/view/pages/video_details/similar_img_card.dart';
import 'package:iotflixcinema/view/pages/video_details/vedio_player/vedio_player_view.dart';
import 'package:iotflixcinema/view/pages/video_details/video_details_info_card.dart';
import 'package:iotflixcinema/view/router/app_router.dart';
import 'package:iotflixcinema/view/widgets/round_border_button.dart';

class VideoDetailsPage extends StatefulWidget {
  final int nestedId;
  final int catId;

  VideoDetailsPage({this.nestedId, this.catId});

  @override
  _VideoDetailsPageState createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends State<VideoDetailsPage> {
  double _animatedHeight = 0;
  bool makeReport = false;
  TextEditingController reportText = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    reportText.text;
  }

  CategoriesViewModel catModel = Get.put(CategoriesViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      //  backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: GetBuilder<VideoDetailsViewModel>(
          builder: (videoDetailsController) => Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      VideoPlayerView(
                        nestedId: widget?.nestedId,
                        model: videoDetailsController?.initialData,
                        videoUrl: videoDetailsController?.initialData?.videoUrl,
                        thumbnailUrl: (videoDetailsController
                                    ?.initialData?.thumbnail ==
                                null
                            ? 'https://picsum.photos/90'
                            : AppUrls.imageBaseUrl +
                                videoDetailsController?.initialData?.thumbnail),
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
                        VideoDetailsInfoCard(
                          imgPath:
                              (videoDetailsController?.initialData?.thumbnail ==
                                      null
                                  ? 'https://picsum.photos/90'
                                  : AppUrls.imageBaseUrl +
                                      videoDetailsController
                                          ?.initialData?.thumbnail),
                          movieName:
                              videoDetailsController?.initialData?.title ??
                                  "Title",
                          movieType: videoDetailsController?.videoDetailsModel
                                  ?.data?.video?.category?.name ??
                              "Category",
                          language: 'English',
                          resolution: videoDetailsController?.videoDetailsModel
                              ?.data?.video?.videoResolution?.name,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ReadMoreText(
                            videoDetailsController?.videoDetailsModel?.data
                                    ?.video?.description ??
                                '',
                            textStyle: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline1.color,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
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
                                    c?.setFavorite(videoDetailsController
                                        ?.initialData?.id);
                                    return GestureDetector(
                                      onTap: () {
                                        if (c.isFavorite == false) {
                                          c.addFavoriteData(
                                            videoDetailsController
                                                ?.initialData?.id
                                                ?.toString(),
                                            context,
                                          );
                                        } else {
                                          c.deleteFavoriteData(
                                              videoDetailsController
                                                  ?.initialData?.id
                                                  ?.toString());
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
                        Divider(
                          height: 20,
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
                                    margin: EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(
                                            color: AppColors.searchBorderColor),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: reportText,
                                            cursorColor:
                                                AppColors.textFieldTextColor,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors
                                                    .textFieldTextColor,
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
                                              id: videoDetailsController
                                                  .videoDetailsModel
                                                  .data
                                                  .video
                                                  .id
                                                  .toString(),
                                              description: reportText.text);
                                          if (controller
                                                  .addReportsModel.status ==
                                              true) {
                                            FlutterToast.showSuccess(
                                                message:
                                                    "Reported Successfully",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Similar To This',
                              style: TextStyle(
                                fontFamily: 'poppins_bold',
                                fontSize: 14,
                                color:
                                    Theme.of(context).textTheme.headline1.color,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0, top: 10, bottom: 5),
                              child: GestureDetector(
                                onTap: () {
                                  AppRouter.navToVideoDetailsMoreVideosPage(
                                      catName: "Similer videos",
                                      catImage: videoDetailsController
                                                  ?.categoryMaylikeModel
                                                  ?.data
                                                  ?.first
                                                  ?.thumbnail !=
                                              null
                                          ? AppUrls.imageBaseUrl +
                                              videoDetailsController
                                                  ?.categoryMaylikeModel
                                                  ?.data
                                                  ?.first
                                                  ?.thumbnail
                                          : "https://picsum.photos/200",
                                      homeDataList: videoDetailsController
                                          ?.categoryMaylikeModel?.data,
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
                        Container(
                          height: wp(50) * (2 / 3),
                          child: ListView.builder(
                            // physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: videoDetailsController
                                    ?.categoryMaylikeModel?.data?.length ??
                                0,
                            itemBuilder: (BuildContext context, int index) =>
                                SimilarImgCard(
                              onTap: () {
                                videoDetailsController.refreshData(
                                    videoDetailsController
                                        ?.categoryMaylikeModel?.data[index]);
                              },
                              imgPath: videoDetailsController
                                          ?.categoryMaylikeModel
                                          ?.data[index]
                                          ?.thumbnail !=
                                      null
                                  ? AppUrls.imageBaseUrl +
                                      videoDetailsController
                                          ?.categoryMaylikeModel
                                          ?.data[index]
                                          ?.thumbnail
                                  : "https://picsum.photos/200",
                            ),
                          ),
                        ),
                        Divider(
                          height: 8,
                          thickness: .5,
                          color: AppColors.dividerColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CastCard(
                            actors: videoDetailsController
                                ?.videoDetailsModel?.data?.video?.actors)
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
      ),
    );
  }
}
