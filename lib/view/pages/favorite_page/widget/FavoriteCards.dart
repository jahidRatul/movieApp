import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/models/home_categories_model.dart';
import 'package:iotflixcinema/core/view_models/fevorite_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/router/app_router.dart';
import 'package:iotflixcinema/view/widgets/rating/rating_bar_indicator.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class FavoriteItemCard extends StatelessWidget {
  FavoriteItemCard({
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

  final HomeData model;

  @override
  Widget build(BuildContext context) {
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
            child: GetBuilder<FavoriteViewModel>(
              builder: (c) => IconSlideAction(
                caption: "Remove",
                color: Colors.transparent,
                icon: Icons.delete,
                closeOnTap: true,
                onTap: () async {
                  onDelete?.call();
                },
              ),
            ),
          )
        ],
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              AppRouter.navToVideoDetailsPage(
                  model, HomePageFragment.favouriteNavId, model.categoryId);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardTheme.color,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              margin: EdgeInsets.all(8.0),
              height: 100.0,
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
                                  AppUrls.imageBaseUrl + "$imgPath"),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model?.title?.substring(
                                      0, min(20, model?.title?.length)) ??
                                  "",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color,
                                  fontFamily: 'poppins_medium',
                                  fontSize: 16.0),
                            ),
                            Text(
                              model?.videoTypeId ?? "Romantic",
                              style: TextStyle(
                                  color: AppColors.yellowColor,
                                  fontFamily: 'poppins_regular',
                                  fontSize: 14.0),
                            ),
                            Container(
                              //  color: Colors.red,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RatingBarIndicator(
                                          rating: 3.50,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                          unratedColor: AppColors.borderColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          height: 15.0,
                                          width: 2,
                                          child: Container(
                                            color: AppColors.devideColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "8.0",
                                          style: TextStyle(
                                              color: AppColors.ShadowRed,
                                              fontFamily: 'poppins_regular',
                                              fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      model?.duration ?? "",
                                      style:
                                          TextStyle(color: AppColors.colorGray),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
