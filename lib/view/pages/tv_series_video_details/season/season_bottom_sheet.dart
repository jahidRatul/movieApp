import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/tv_series_seasons_model.dart';
import 'package:iotflixcinema/core/view_models/tv_series_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/pages/tv_series_video_details/season/episod_bottom_sheet.dart';

bool disableEpisode = true;

class BottomSheetSeason {
  static bottomSheetPro({
    BuildContext context,
    List<Seasons> seasons,
  }) async {
    showModalBottomSheet(
      backgroundColor: AppColors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return BottomSheetWidget(seasons);
      },
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  final List<Seasons> seasons;

  BottomSheetWidget(this.seasons);

  // BottomSheetWidget();
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  TvSeriesViewModel tvSeriesController = Get.put(TvSeriesViewModel());

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              spreadRadius: .1,
              blurRadius: 3,
              offset: Offset(0, 0),
              color: AppColors.ShadowRed.withOpacity(.3),
            )
          ]),
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            "Select Season here",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.headline1.color,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget?.seasons?.length ?? 0,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      disableEpisode = false;
                      episodeNo = "--";
                      tvSeriesController.getTvSeriesSeasonEpisodeMethode(
                          seasonid: widget?.seasons[index]?.id, type: 'filter');
                      print("pressed");
                      // AppRouter.back();
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            (index < 9)
                                ? '0' + widget.seasons[index].id.toString()
                                : widget.seasons[index].id.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(context).textTheme.headline1.color,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.ShadowRed.withOpacity(.2),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
