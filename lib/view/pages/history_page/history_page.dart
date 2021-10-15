import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:iotflixcinema/core/view_models/history_view_model/history_view_model.dart';
import 'package:iotflixcinema/view/cards/app_bars/app_bar_with_title.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/router/app_router.dart';

import 'card/history_card.dart';

class HistoryPage extends StatefulWidget {
  final int nestedId;

  HistoryPage({this.nestedId});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int rebuild = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IotaAppBar.appBarWithTitle(
          title: "History",
          borderColor: AppColors.deepRed,
          backButtonOnTap: () {
            AppRouter.back(nestedId: widget?.nestedId);
          }),

      //drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: 10.0,
            ),
            child: GetX<HistoryViewModel>(
              builder: (c) => new ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  reverse: true,
                  itemCount:
                      (c.historyDataModel?.value?.data?.data?.length ?? 0),
                  itemBuilder: (BuildContext context, int index) {
                    return HistoryItemCard(
                      model: c.historyDataModel?.value?.data?.data[index],
                      imgPath: c.historyDataModel?.value?.data?.data[index]
                          ?.video?.thumbnail,
                      onTap: () {
                        AppRouter.navToVideoDetailsPage(
                            c.historyDataModel?.value?.data?.data[index]?.video,
                            widget?.nestedId,
                            c.historyDataModel?.value?.data?.data[index]?.video
                                ?.categoryId);
                      },
                      onDelete: () {
                        c.historyDataModel?.value?.data?.data?.removeAt(index);
                        setState(() {});
                      },
                    );
                  }),
            ),

            /* child: GetX<HomeViewModel>(
              builder: (con) {
                print("rebuild : ${++rebuild}");
                return con.listViewWidget.value;
              },
            ),*/
          ),
        ),
      ),
    );
  }
}
