import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/home_categories_model.dart';
import 'package:iotflixcinema/core/view_models/video_view_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/pages/video_details/vedio_player/vimo_player.dart';
import 'package:iotflixcinema/view/pages/video_details/vedio_player/youtube_player.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

import 'app_player.dart';

class VideoPlayerView extends StatefulWidget {
  final String thumbnailUrl;
  final String videoUrl;
  final int nestedId;
  final HomeData model;

  VideoPlayerView({
    this.thumbnailUrl,
    this.videoUrl,
    this.nestedId,
    this.model,
  });

  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  Widget playerView;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //playerView = getInitialView();
  }

  setPlayer() {
    if ((widget?.videoUrl?.contains("youtube") ?? false)) {
      playerView = YoutubePlayerView(widget?.videoUrl);
    } else if (widget?.videoUrl?.contains("vimeo.com") ?? false) {
      playerView = VimeoPlayerFlutter(widget?.videoUrl);
    } else {
      playerView = AppPlayer(widget?.videoUrl);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return playerView ??
        Container(
          height: hp(35),
          width: wp(100),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: PCacheImage(widget?.thumbnailUrl), fit: BoxFit.cover),
          ),
          child: Center(
            child: GetBuilder<VideoViewViewModel>(
              builder: (c) => InkWell(
                onTap: () {
                  setPlayer();
                  c.historyAddMethod(widget?.model?.id?.toString());
                },
                child: CircleAvatar(
                  backgroundColor: AppColors.ShadowRed.withOpacity(.5),
                  radius: 30,
                  child: ImageIcon(AssetImage("images/playIcon.png"),
                      size: 30, color: AppColors.white),
                ),
              ),
            ),
          ),
        );
  }
}
