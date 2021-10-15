import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/api/app_urls.dart';
import 'package:iotflixcinema/core/view_models/actor_view_model.dart';
import 'package:iotflixcinema/view/cards/app_bars/app_bar_with_title.dart';
import 'package:iotflixcinema/view/router/app_router.dart';

import 'card/actors_card.dart';

class ActorsPage extends StatefulWidget {
  final int nestedId;

  ActorsPage({this.nestedId});

  @override
  _ActorsPageState createState() => _ActorsPageState();
}

class _ActorsPageState extends State<ActorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: AppColors.pageBackground,
      appBar: IotaAppBar.appBarWithTitle(
        title: "Actors",
        backButtonOnTap: () {
          AppRouter.back(nestedId: widget?.nestedId);
        },
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: GetBuilder<ActorViewModel>(
                  builder: (controller) => Container(
                    child: GridView.builder(
                      itemCount: controller?.actorModel?.data?.length ?? 0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10,
                        childAspectRatio: 150.0 / 180.0,
                      ),
                      itemBuilder: (_, i) => ActorsCard(
                        name: controller?.actorModel?.data[i]?.name ?? "Actor",
                        imagePath: AppUrls.imageBaseUrl +
                                controller?.actorModel?.data[i]?.img ??
                            "",
                        onTap: () {
                          controller.getActorsMovies(
                              id: controller?.actorModel?.data[i]?.id);
                          AppRouter.navToActorsAllMoviesPage(
                              catName: controller?.actorModel?.data[i]?.name ??
                                  "Actor",
                              catImage: AppUrls.imageBaseUrl +
                                      controller?.actorModel?.data[i]?.img ??
                                  "",
                              nestedId: widget.nestedId);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
