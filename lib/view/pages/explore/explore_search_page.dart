import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/view_models/search/search_view_model.dart';
import 'package:iotflixcinema/core/view_models/theme_view_model.dart';
import 'package:iotflixcinema/view/constant/app_colors.dart';
import 'package:iotflixcinema/view/pages/explore/view/actore_result_view.dart';
import 'package:iotflixcinema/view/pages/explore/view/genre_result_view.dart';
import 'package:iotflixcinema/view/pages/explore/view/top_result_view.dart';

class ExploreSearchPage extends StatefulWidget {
  final int nestedId;

  ExploreSearchPage({this.nestedId});

  @override
  _ExploreSearchPageState createState() => _ExploreSearchPageState();
}

class _ExploreSearchPageState extends State<ExploreSearchPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: GetBuilder<ThemeController>(
          builder: (controller) => Container(
            decoration: BoxDecoration(
                color: controller.themeMode?.index == 2
                    ? AppColors.fillBorderColor
                    : AppColors.dividerColor,
                border: Border.all(color: AppColors.searchBorderColor),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Row(
              children: [
                Expanded(
                  child: GetBuilder<SearchViewModel>(
                    builder: (c) => SimpleAutoCompleteTextField(
                      controller: _searchController,
                      // cursorColor: Theme.of(context).textTheme.headline1.color,
                      suggestions: c?.searchSuggestion,
                      textSubmitted: (s) {
                        //  _searchController?.text = s;
                        c?.searchQuery(value: s);
                        c?.addToSuggestionList(s);
                      },

                      clearOnSubmit: false,

                      style: TextStyle(
                          fontSize: 9,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding:
                            EdgeInsets.only(left: 10, top: 8, bottom: 8),
                        hintText: "Search by names",
                        hintStyle: TextStyle(
                            fontSize: 9,
                            color: Theme.of(context).textTheme.headline1.color,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: 17,
                      color: AppColors.borderColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottom: PreferredSize(
            child: Container(
              color: AppColors.deepRed,
              height: 0.5,
            ),
            preferredSize: Size.fromHeight(10.0)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 30.0),
            child: GetBuilder<SearchViewModel>(
              builder: (c) => ClipOval(
                child: GestureDetector(
                  onTap: () {
                    if (_searchController?.text == null) return;
                    c?.searchQuery(value: _searchController?.text);
                  },
                  child: ImageIcon(
                    AssetImage('images/searchIcon.png'),
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: GetBuilder<SearchViewModel>(
          builder: (co) => Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopResultSearchView(
                model: co?.searchResultModel?.data?.results?.videos,
              ),
              ActorsResultView(
                model: co?.searchResultModel?.data?.results?.actors,
              ),
              GenreResultView(
                model: co?.searchResultModel?.data?.results?.genres,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
