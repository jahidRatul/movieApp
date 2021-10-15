import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class ActorImgCard extends StatefulWidget {
  final String name;
  final String imageUrl;

  ActorImgCard({this.imageUrl, this.name});

  @override
  _ActorImgCardState createState() => _ActorImgCardState();
}

class _ActorImgCardState extends State<ActorImgCard> {
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;

    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: [
          Expanded(
            child: Container(
              // width: wp(29),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  image: PCacheImage(
                    AppUrls.imageBaseUrl+"${widget?.imageUrl}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Text(
              widget?.name??'',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 6,
                  fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}
