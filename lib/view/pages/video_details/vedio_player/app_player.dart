import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class AppPlayer extends StatefulWidget {
  final String url;

  AppPlayer(this.url);

  @override
  _AppPlayerState createState() => _AppPlayerState();
}

class _AppPlayerState extends State<AppPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer.network(
         "https://www.dailymotion.com/embed/video/x5s90td"?? "${widget?.url}",
          betterPlayerConfiguration: BetterPlayerConfiguration(
            aspectRatio: 16 / 9,
          ),
        ),
      ),
    );
  }
}
