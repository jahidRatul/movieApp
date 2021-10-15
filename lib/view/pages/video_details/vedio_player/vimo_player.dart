import 'package:flutter/material.dart';
import 'package:flutter_youtube_vimeo/flutter_youtube_vimeo.dart';
import 'package:vimeoplayer/vimeoplayer.dart';

class VimeoPlayerFlutter extends StatefulWidget {
  final String url;

  VimeoPlayerFlutter(this.url);

  @override
  _VimeoPlayerFlutterState createState() => _VimeoPlayerFlutterState();
}

class _VimeoPlayerFlutterState extends State<VimeoPlayerFlutter> {
  String id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.id = getId(widget?.url);
    print("vimo playerId ;- $id");
  }

  String getId(String url) {
    try {
      return url?.split('/')?.last;
    } catch (e, t) {
      print(e);
      print(t);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
         aspectRatio: 16/9,
            child: id != null ? YouVimPlayer('vimeo', '$id') : Container()),
      ],
    );
  }
}
