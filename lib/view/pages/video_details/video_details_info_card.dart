import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class VideoDetailsInfoCard extends StatefulWidget {
  final String imgPath;
  final String movieName;
  final String movieType;
  final String language;
  final int resolution;

  VideoDetailsInfoCard(
      {this.imgPath,
      this.movieName,
      this.movieType,
      this.language,
      this.resolution});

  @override
  _VideoDetailsInfoCardState createState() => _VideoDetailsInfoCardState();
}

class _VideoDetailsInfoCardState extends State<VideoDetailsInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 90,
          height: 75,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: PCacheImage(
                GetUtils.isURL(widget.imgPath)
                    ? widget.imgPath
                    : 'https://picsum.photos/90/70',
              ),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.movieName ?? "Movie Name",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'poppins_bold',
                  color: Theme.of(context).textTheme.headline1.color,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.movieType ?? "Movie Type",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.headline3.color,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Language: ${widget.language}',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).textTheme.headline2.color,
                    ),
                  ),
                  Image.asset(
                    widget.resolution == 1080
                        ? 'assets/images/video_quality/hd.png'
                        : widget.resolution == 720
                            ? 'assets/images/video_quality/720.png'
                            : widget.resolution == 480
                                ? 'assets/images/video_quality/480.png'
                                : widget.resolution == 360
                                    ? 'assets/images/video_quality/360.png'
                                    : 'assets/images/video_quality/480.png',
                    height: 14,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: .5,
                color: AppColors.dividerColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
