import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotflixcinema/core/utils/local_auth/local_auth_get_storage.dart';
import 'package:iotflixcinema/core/view_bindings/action_category_page_bindings.dart';
import 'package:iotflixcinema/core/view_bindings/home_page_bindings.dart';
import 'package:iotflixcinema/view/pages/action_category/action_category_page.dart';
import 'package:iotflixcinema/view/pages/all_video_page/all_video_page.dart';
import 'package:iotflixcinema/view/pages/dashboard/dashboard_screen.dart';
import 'package:iotflixcinema/view/pages/explore/explore_page.dart';
import 'package:iotflixcinema/view/pages/favorite_page/Favorite_Page.dart';
import 'package:iotflixcinema/view/pages/profile_with_login/profile_with_login.dart';
import 'package:iotflixcinema/view/pages/profile_without_login/profile_without_login.dart';
import 'package:iotflixcinema/view/widgets/custom_drawer.dart';

import 'bottom_bar/bottom_bar.dart';

class HomePageFragment {
  static const int dashboardNavId = 1;
  static const int exploreNavId = 2;
  static const int liveNavId = 3;
  static const int favouriteNavId = 4;
  static const int profileNavId = 5;

  static const String dashboard = "dashboard";
  static const String explore = "explore";
  static const String live = "live";
  static const String favourite = "favourite";
  static const String profile = "profile";

  static getInitialIndex(String page) {
    if (page == dashboard) return 0;
    if (page == explore) return 1;
    if (page == live) return 2;
    if (page == favourite) return 3;
    if (page == profile) return 4;
  }
}

class HomePage extends StatefulWidget {
  final String page;

  HomePage({
    this.page = HomePageFragment.dashboard,
  });

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  String currentPage = 'dashboard';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = widget.page;
  }

  //GlobalKey<NavigatorState> dashboardKey = Get.nestedKey(HomePageFragment.dashboardNavId);

  // Dashboard()
  /* int dashboard = 1;
  final int explore = 2;
  final int live = 3;
  final int favourite = 4;
  final int profile = 5;*/
  Map<String, Widget> pageView = <String, Widget>{
    "dashboard": false
        ? Dashboard()
        : Navigator(
            key: Get.nestedKey(HomePageFragment.dashboardNavId),
            initialRoute: "/",
            onUnknownRoute: (settings) {
              return GetPageRoute(
                page: () => Dashboard(),
              );
            },
            onGenerateRoute: (settings) {
              print("nestedKey:-  $settings ");
              if (settings.name == "/ActionCategoryPage") {
                return GetPageRoute(
                  routeName: "/ActionCategoryPage",
                  page: () => ActionCategoryPage(),
                );
              }
              return GetPageRoute(
                page: () => Dashboard(),
              );
            }),

    "explore": false
        ? Dashboard()
        : Navigator(
            key: Get.nestedKey(HomePageFragment.exploreNavId),
            initialRoute: "/",
            onUnknownRoute: (settings) {
              return GetPageRoute(
                page: () => ExplorePage(),
              );
            },
            onGenerateRoute: (settings) {
              print("nestedKey:-  $settings ");
              if (settings.name == "/ActionCategoryPage") {
                return GetPageRoute(
                  routeName: "/ActionCategoryPage",
                  page: () => ActionCategoryPage(),
                );
              }
              return GetPageRoute(
                page: () => ExplorePage(),
              );
            }),

    // "explore": ExplorePage(),
    "live": false
        ? AllVideoPage()
        : Navigator(
            key: Get.nestedKey(HomePageFragment.liveNavId),
            initialRoute: "/",
            onGenerateRoute: (settings) {
              print("nestedKey:-  $settings ");
              if (settings.name == "/ActionCategoryPage") {
                return GetPageRoute(
                  routeName: "/ActionCategoryPage",
                  page: () => ActionCategoryPage(),
                  binding: ActionCategoryPageBindings(),
                );
              }
              return GetPageRoute(
                page: () => AllVideoPage(),
                binding: HomePageBindings(),
              );
            }),
    "favourite": Navigator(
      key: Get.nestedKey(HomePageFragment.favouriteNavId),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return GetPageRoute(page: () => FavoritePage());
      },
    ),
    "profile": Navigator(
      key: Get.nestedKey(HomePageFragment.profileNavId),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        String token = LocalDBUtils.getJWTToken();
        return GetPageRoute(
          routeName: "/profile",
          page: () => token == null
              ? ProfileWithoutLogIn(
                  nestedId: HomePageFragment.profileNavId,
                )
              : ProfileWithLogIn(
                  nestedId: HomePageFragment.profileNavId,
                ),
        );
      },
    ),
  };

  changePage(String pageName) {
    if (currentPage == pageName) {
      switch (pageName) {
        case HomePageFragment.dashboard:
          Get.nestedKey(HomePageFragment.dashboardNavId)
              .currentState
              .popUntil((route) => route.isFirst);
          break;
        case HomePageFragment.explore:
          Get.nestedKey(HomePageFragment.exploreNavId)
              .currentState
              .popUntil((route) => route.isFirst);
          break;
        case HomePageFragment.live:
          Get.nestedKey(HomePageFragment.liveNavId)
              .currentState
              .popUntil((route) => route.isFirst);
          break;
        case HomePageFragment.favourite:
          Get.nestedKey(HomePageFragment.favouriteNavId)
              .currentState
              .popUntil((route) => route.isFirst);
          break;
        case HomePageFragment.profile:
          Get.nestedKey(HomePageFragment.profileNavId)
              .currentState
              .popUntil((route) => route.isFirst);
          break;
        default:
      }
    } else {
      setState(() {
        currentPage = pageName;
      });
    }
    //  pageController.jumpToPage(HomePageFragment.getInitialIndex(pageName));
  }

  Widget getAppBar() {
    if (currentPage == HomePageFragment.dashboard) {
      return null;
    } else if (currentPage == HomePageFragment.explore)
      return null;
    // return IotaAppBar.basicAppBarWithSearchIcon();

    else if (currentPage == HomePageFragment.live) {
      return null;
    } else if (currentPage == HomePageFragment.favourite) return null;

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      drawer: CustomDrawer(),
      bottomNavigationBar: AppBottomBar(
        page: widget?.page,
        changePage: changePage,
      ),
      body: pageView[currentPage],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
