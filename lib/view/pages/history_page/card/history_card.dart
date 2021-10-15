import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/models/history/history_data_model.dart';
import 'package:iotflixcinema/core/view_models/video_view_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/router/app_router.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';
import 'package:toast/toast.dart';

class HistoryItemCard extends StatelessWidget {
  HistoryItemCard({
    this.index,
    this.imgPath,
    this.onTap,
    this.model,
    this.onDelete,
  });

  final int index;
  final String imgPath;
  final Function onTap;
  final Function onDelete;
  final HistoryUnitData model;

  Future<Uint8List> getImage() async {
    final ByteData bytes =
        await rootBundle.load(imgPath ?? "assets/images/genre/72563.jpg");
    final Uint8List list = bytes.buffer.asUint8List();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Container(
      child: Slidable(
        key: ValueKey(index),
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0),
            decoration: BoxDecoration(
                color: AppColors.ShadowRed,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0))),
            child: GetBuilder<VideoViewViewModel>(
              builder: (c) => IconSlideAction(
                caption: "Remove",
                color: Colors.transparent,
                icon: Icons.delete,
                closeOnTap: true,
                onTap: () async {
                  onDelete?.call();
                  int res = await c?.deleteSingleHistory(model?.id?.toString());
                  if (res == 200) {
                    Toast.show("History removed", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  }
                },
              ),
            ),
          )
        ],
        child: Container(
          child: GestureDetector(
            onTap: () {
              // AppRouter.navToVideoDetailsPage();
            },
            child: Container(
              height: 100.0,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardTheme.color,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    margin: EdgeInsets.only(
                        left: 8.0, top: 8.0, bottom: 8.0, right: 30),
                    height: 100.0,
                    // width: wp(100),
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: 100.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: PCacheImage(
                                      AppUrls.imageBaseUrl +
                                          "${model?.video?.thumbnail}",
                                    ),
                                  ),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0))),
                              width: 100.0,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    model?.video?.title ?? "",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .color,
                                        fontFamily: 'poppins_medium',
                                        fontSize: 16.0),
                                  ),
                                  Text(
                                    "Superhero",
                                    style: TextStyle(
                                        color: AppColors.yellowColor,
                                        fontFamily: 'poppins_regular',
                                        fontSize: 14.0),
                                  ),
                                  // SizedBox(height: 5,),
                                  Container(
                                    child: Text(
                                      model?.video?.duration ?? "",
                                      style:
                                          TextStyle(color: AppColors.colorGray),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25,
                    right: 10,
                    child: InkWell(
                      onTap: onTap,
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(),
                        child: Align(
                          alignment: Alignment(0, 0),
                          child: CircleAvatar(
                            backgroundColor:
                                AppColors.ShadowRed.withOpacity(.9),
                            radius: 20,
                            child: Align(
                              alignment: Alignment(0.15, 0),
                              child: ImageIcon(
                                  AssetImage("images/playIcon.png"),
                                  size: 20,
                                  color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
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
