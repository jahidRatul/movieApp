import 'package:flutter/material.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';

class TvSeriesInfoCard extends StatefulWidget {
  final String imgPath;
  final String movieName;
  final String movieType;
  final String language;
  final String episodeTitle;
  final int resolution;

  TvSeriesInfoCard(
      {this.imgPath,
      this.movieName,
      this.movieType,
      this.language,
      this.episodeTitle,
      this.resolution});

  @override
  _TvSeriesInfoCardState createState() => _TvSeriesInfoCardState();
}

class _TvSeriesInfoCardState extends State<TvSeriesInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 92,
          height: 92,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            image: DecorationImage(
              image: NetworkImage(
                widget?.imgPath,
              ),
              fit: BoxFit.cover,
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
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.movieName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'poppins_bold',
                        color: Theme.of(context).textTheme.headline1.color,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                widget.movieType,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Episode: ${widget.episodeTitle}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).textTheme.headline1.color,
                      ),
                    ),
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
