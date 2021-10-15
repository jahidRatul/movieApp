import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:iotflixcinema/core/models/home_categories_model.dart';
import 'package:iotflixcinema/view/pages/dashboard/cards/trending_movie_card.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/router/app_router.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class TrendingNowView extends StatefulWidget {
  final List<Trending> listModel;
  final Function onMoreTap;

  TrendingNowView({this.listModel, this.onMoreTap});

  @override
  _TrendingNowViewState createState() => _TrendingNowViewState();
}

class _TrendingNowViewState extends State<TrendingNowView> {
  int itemCount = 15;
  AutoScrollController controller;
  List<List<int>> randomList;
  static final maxCount = 16;
  final random = math.Random();
  final scrollDirection = Axis.horizontal;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
    randomList = List.generate(maxCount,
        (index) => <int>[index, (1000 * random.nextDouble()).toInt()]);
  }

  contol() {
    //controller.jumpTo(value)
  }

  int counter = -1;

  Future _scrollToIndex() async {
    setState(() {
      counter += 3;

      // if (counter >= maxCount) counter = 0;
      if (counter >= maxCount) counter = maxCount;
    });

    await controller.scrollToIndex(counter,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(counter);
  }

  Future _scrollToBack() async {
    setState(() {
      counter -= 3;

      //if (counter < 0) counter = itemCount;
      if (counter < 0) counter = 0;
    });

    await controller.scrollToIndex(counter,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(counter);
  }

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
                    'Trending Now',
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
                    onTap: widget.onMoreTap,
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
              alignment: Alignment.center,
              child: Container(
                height: wp(29) * (13 / 10),
                child: GestureDetector(
                  onHorizontalDragEnd: (dragEndDetails) {
                    if (dragEndDetails.primaryVelocity < 0) {
                      // Page forwards
                      print('Move page forwards');
                      _scrollToIndex();
                    } else if (dragEndDetails.primaryVelocity > 0) {
                      // Page backwards
                      print('Move page backwards');
                      _scrollToBack();
                    }
                  },
                  child: ListView.builder(
                    //  controller: controller,
                    controller: controller,
                    physics: NeverScrollableScrollPhysics(),
                    //  physics: CustomScrollPhysics(),
                    //  physics: PageScrollPhysics(),
                    shrinkWrap: true,
                    //addAutomaticKeepAlives: false,
                    addSemanticIndexes: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget?.listModel?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) =>
                        _getRow(index, 1.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getRow(int index, double height) {
    return _wrapScrollTag(
      index: index,
      child: Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: TrendingMovieWidget(
          onTap: () {
            AppRouter.navToVideoDetailsPage(
                widget?.listModel[index]?.video,
                HomePageFragment.dashboardNavId,
                widget?.listModel[index]?.video?.categoryId);
          },
          imgPath: widget?.listModel[index]?.video?.thumbnail,
          movieIndex: index + 1,
        ),
      ),
    );
  }

  Widget _wrapScrollTag({int index, Widget child}) => AutoScrollTag(
        key: ValueKey(index),
        controller: controller,
        index: index,
        child: child,
        highlightColor: Colors.black.withOpacity(0.1),
      );
}
