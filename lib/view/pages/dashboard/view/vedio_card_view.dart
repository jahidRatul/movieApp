import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:iotflixcinema/core/models/home_categories_model.dart';
import 'package:iotflixcinema/view/pages/dashboard/cards/just_added_movie_card.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/router/app_router.dart';

class VideoCardView extends StatefulWidget {
  final String titleName;
  final Function onMoreTap;
  final List<HomeData> listModel;

  VideoCardView({
    this.titleName,
    this.onMoreTap,
    this.listModel,
  });

  @override
  _VideoCardViewState createState() => _VideoCardViewState();
}

class _VideoCardViewState extends State<VideoCardView> {
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Container(
      child: Visibility(
        visible: (widget?.listModel?.length ?? 0) != 0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 15, bottom: 5),
                  child: Text(
                    '${widget?.titleName ?? ""}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Theme.of(context).textTheme.headline1.color,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 8.0, top: 15, bottom: 5),
                  child: GestureDetector(
                    onTap: widget?.onMoreTap,
                    child: Text(
                      'More',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: Color(0xffE15050)),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: wp(29) * (13 / 10),
              child: ListView.builder(
                // physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget?.listModel?.length ?? 0,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: JustAddedMovieCard(
                    imgPath: widget?.listModel[index]?.thumbnail,
                    onTap: () {
                      print("${widget?.listModel[index]?.title}");
                      AppRouter.navToVideoDetailsPage(
                          widget?.listModel[index],
                          HomePageFragment.dashboardNavId,
                          widget?.listModel[index].categoryId);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
