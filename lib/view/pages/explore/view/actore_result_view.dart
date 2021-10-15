import 'package:flutter/material.dart';
import 'package:iotflixcinema/core/models/search/search_result_model.dart';
import 'package:iotflixcinema/view/pages/explore/cards/actor_img_card.dart';

class ActorsResultView extends StatefulWidget {
  final List<Actors> model;

  ActorsResultView({this.model});

  @override
  _ActorsResultViewState createState() => _ActorsResultViewState();
}

class _ActorsResultViewState extends State<ActorsResultView> {
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
                    'Actors',
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
                        childAspectRatio: 6 / 7,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6),

                    itemCount: (widget?.model?.length ?? 0),
                    itemBuilder: (BuildContext context, int index) =>
                        ActorImgCard(
                      name: widget?.model[index]?.name,
                      imageUrl: widget?.model[index]?.img,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
