import 'package:flutter/material.dart';
import 'package:iotflixcinema/core/models/search/search_result_model.dart';
import 'package:iotflixcinema/view/pages/explore/cards/top_result_img_card.dart';

class TopResultSearchView extends StatefulWidget {
  final List<Videos> model;

  TopResultSearchView({this.model});

  @override
  _TopResultSearchViewState createState() => _TopResultSearchViewState();
}

class _TopResultSearchViewState extends State<TopResultSearchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (widget?.model?.length ?? 0) == 0
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, top: 15, bottom: 5),
                  child: Text(
                    'Top Result',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Theme.of(context).textTheme.headline1.color,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    // physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 4 / 5,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6),

                    itemCount: (widget?.model?.length ?? 0),
                    itemBuilder: (BuildContext context, int index) =>
                        TopResultImgCard(widget?.model[index]?.img),
                  ),
                ),
              ],
            ),
    );
  }
}
