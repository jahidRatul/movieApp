import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerView extends StatefulWidget {
  final String url;

  YoutubePlayerView(this.url);

  @override
  _YoutubePlayerViewState createState() => _YoutubePlayerViewState();
}

class _YoutubePlayerViewState extends State<YoutubePlayerView> {
  YoutubePlayerController _controller;

  playMethod() {
    String videoId;
    try {
      videoId = YoutubePlayer.convertUrlToId(widget?.url);
      _controller = YoutubePlayerController(
        initialVideoId: '$videoId',
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
        ),
      );
    } catch (e, t) {
      print(e);
      print(t);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playMethod();
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Container(
      height: hp(35),
      width: wp(100),
      child: _controller != null
          ? YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressColors: ProgressBarColors(
                playedColor: Colors.redAccent,
                handleColor: Colors.red,
              ),
            )
          : Container(),
    );
  }
}
