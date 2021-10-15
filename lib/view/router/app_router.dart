import 'dart:io';

import 'package:get/get.dart';
import 'package:iotflixcinema/core/models/home_categories_model.dart';
import 'package:iotflixcinema/core/models/tv_series_seasons_model.dart';
import 'package:iotflixcinema/core/view_bindings/Update_user_profile_bindings.dart';
import 'package:iotflixcinema/core/view_bindings/action_category_page_bindings.dart';
import 'package:iotflixcinema/core/view_bindings/actor_page_bindings.dart';
import 'package:iotflixcinema/core/view_bindings/country_bindings.dart';
import 'package:iotflixcinema/core/view_bindings/feedback_bindings.dart';
import 'package:iotflixcinema/core/view_bindings/genre_page_bindings.dart';
import 'package:iotflixcinema/core/view_bindings/history_bindings/history_bindings.dart';
import 'package:iotflixcinema/core/view_bindings/home_page_bindings.dart';
import 'package:iotflixcinema/core/view_bindings/search/search_bindings.dart';
import 'package:iotflixcinema/core/view_bindings/settings_page_bindings.dart';
import 'package:iotflixcinema/core/view_bindings/sign_in_page_bindings.dart';
import 'package:iotflixcinema/core/view_bindings/sign_up_page_bindongs.dart';
import 'package:iotflixcinema/core/view_bindings/sub_scribe_page_bindings.dart';
import 'package:iotflixcinema/core/view_bindings/tv_series_video_details_bindings.dart';
import 'package:iotflixcinema/core/view_bindings/video_details_bindings.dart';
import 'package:iotflixcinema/view/pages/about_app/about_app_page.dart';
import 'package:iotflixcinema/view/pages/action_category/action_category_page.dart';
import 'package:iotflixcinema/view/pages/action_category/sub_action_category_page.dart';
import 'package:iotflixcinema/view/pages/actors/actors_all_movies_page.dart';
import 'package:iotflixcinema/view/pages/actors/actors_page.dart';
import 'package:iotflixcinema/view/pages/cookie_policy/cookie_policy.dart';
import 'package:iotflixcinema/view/pages/country/country_all_movies_page.dart';
import 'package:iotflixcinema/view/pages/country/country_page.dart';
import 'package:iotflixcinema/view/pages/dashboard/home_categories_more_videos_page.dart';
import 'package:iotflixcinema/view/pages/explore/explore_search_page.dart';
import 'package:iotflixcinema/view/pages/favorite_page/Favorite_Page.dart';
import 'package:iotflixcinema/view/pages/genre/genre_all_movies_page.dart';
import 'package:iotflixcinema/view/pages/genre/genre_page.dart';
import 'package:iotflixcinema/view/pages/help_feedback/help_feedback_page.dart';
import 'package:iotflixcinema/view/pages/history_page/history_page.dart';
import 'package:iotflixcinema/view/pages/home/homepage.dart';
import 'package:iotflixcinema/view/pages/privacy_policy/pricavy_policy.dart';
import 'package:iotflixcinema/view/pages/profile_with_login/edit_profile.dart';
import 'package:iotflixcinema/view/pages/profile_with_login/profile_with_login.dart';
import 'package:iotflixcinema/view/pages/setting_page/setting_screen.dart';
import 'package:iotflixcinema/view/pages/share/share_page.dart';
import 'package:iotflixcinema/view/pages/signin_page/Sign_In_Page.dart';
import 'package:iotflixcinema/view/pages/signup_page/signup_page.dart';
import 'package:iotflixcinema/view/pages/subcribe/sub_cribe_page.dart';
import 'package:iotflixcinema/view/pages/terms_of_use/terms_of_use.dart';
import 'package:iotflixcinema/view/pages/tv_series_category/individual_season_page.dart';
import 'package:iotflixcinema/view/pages/tv_series_category/tv_series_category_page.dart';
import 'package:iotflixcinema/view/pages/tv_series_category/tv_series_seasons_page.dart';
import 'package:iotflixcinema/view/pages/tv_series_video_details/tv_series_video_details_page.dart';
import 'package:iotflixcinema/view/pages/video_details/video_details_more_videospage.dart';
import 'package:iotflixcinema/view/pages/video_details/video_details_page.dart';
import 'package:iotflixcinema/view/router/router_state.dart';

class AppRouter {
  static int _nestedId;

  static setNestedId(int id) {
    _nestedId = id;
  }

  static back({dynamic result, int nestedId}) {
    RouterState.pop(nestedId ?? -1);
    return Get.back(result: result, id: nestedId);
    // return Get.back(result: result, id: _nestedId);
    //return Navigator.of(Get.key.currentContext).pop();
  }

  static navToSignInPage() {
    return Get.to(
      SignInPage(),
      binding: SignInPageBindings(),
    );
  }

  static navToSignUpPage() {
    return Get.to(
      SignUpPage(),
      binding: SignUpPageBinding(),
    );
  }

  static navToFavoritePage() {
    return Get.to(FavoritePage());
  }

  static navToExploreSearchPage({int nestedId}) {
    return Get.to(
      ExploreSearchPage(),
      id: nestedId,
      transition: Transition.fadeIn,
      binding: SearchBindings(),
    );
  }

  static navToEditProfilePage({int nestedId}) {
    RouterState.push(nestedId ?? -1, "EditProfilePage");
    return Get.to(
      EditProfilePage(),
      binding: UpdateUserProfileBindings(),
      id: nestedId,
    );
  }

  static navToProfileWithLogIn() {
    return Get.to(ProfileWithLogIn());
  }

  static navToSettingScreen() {
    return Get.to(
      SettingScreen(),
      transition: Transition.fadeIn,
      binding: SettingsPageBindings(),
    );
  }

  static navToHelpFeedbackPage() {
    return Get.to(
      HelpFeedbackPage(),
      binding: FeedbackBindings(),
    );
  }

  static navToSharePage() {
    return Get.to(
      SharePage(),
    );
  }

  static navToAboutAppPage({
    String title,
    String version,
    String mail,
    String url,
    String moreApp,
    String developedBy,
    String copyRight,
    String description,
  }) {
    return Get.to(AboutAppPage(
      title: title,
      url: url,
      copyRight: copyRight,
      developedBy: developedBy,
      mail: mail,
      moreApp: moreApp,
      version: version,
      description: description,
    ));
  }

  static navToGenrePage({int nestedId}) {
    return Get.to(
      GenrePage(
        nestedId: nestedId,
      ),
      id: nestedId,
      binding: GenrePageBindings(),
    );
  }

  static navToCountryPage({int nestedId}) {
    return Get.to(
      CountryPage(
        nestedId: nestedId,
      ),
      binding: CountryBindings(),
      id: nestedId,
    );
  }

  static navToActorPage({int nestedId}) {
    return Get.to(
      ActorsPage(
        nestedId: nestedId,
      ),
      binding: ActorPageBindings(),
      id: nestedId,
    );
  }

  static navToSubscriptionPlan() {
    return Get.to(
      SubScribePage(),
      transition: Transition.fadeIn,
      binding: SubScribePageBindings(),
    );
  }

  static navToActionCategoryPage(
      {int nestedId, String catName, String catImage}) {
    return Get.to(
      ActionCategoryPage(
        catName: catName,
        catImage: catImage,
        nestedId: nestedId,
      ),
      id: nestedId,
      binding: ActionCategoryPageBindings(),
      transition: Transition.fadeIn,
    );
  }

  static navToActorsAllMoviesPage(
      {int nestedId, String catName, String catImage}) {
    return Get.to(
      ActorsAllMoviesPage(
        catName: catName,
        catImage: catImage,
        nestedId: nestedId,
      ),
      id: nestedId,
      // binding: ActionCategoryPageBindings(),
      transition: Transition.fadeIn,
    );
  }

  static navToMoreVideosPage({
    int nestedId,
    String catName,
    String catImage,
    List<HomeData> homeDataList,
  }) {
    return Get.to(
      HomeCategoryMoreVideosPage(
        catName: catName,
        catImage: catImage,
        nestedId: nestedId,
        listModel: homeDataList,
      ),
      id: nestedId,
      binding: ActionCategoryPageBindings(),
      transition: Transition.fadeIn,
    );
  }

  static navToVideoDetailsMoreVideosPage({
    int nestedId,
    String catName,
    String catImage,
    List<HomeData> homeDataList,
  }) {
    return Get.to(
      VideoDetailsMoreVideosPage(
        catName: catName,
        catImage: catImage,
        nestedId: nestedId,
        listModel: homeDataList,
      ),
      id: nestedId,
      binding: ActionCategoryPageBindings(),
      transition: Transition.fadeIn,
    );
  }

  static navToSubActionCategoryPage(
      {int nestedId, String catName, String catImage}) {
    return Get.to(
      SubActionCategoryPage(
        catName: catName,
        catImage: catImage,
        nestedId: nestedId,
      ),
      id: nestedId,
      binding: ActionCategoryPageBindings(),
      transition: Transition.fadeIn,
    );
  }

  static navToGenreAllMoviesPage({int nestedId}) {
    return Get.to(
      GenreAllMoviesPage(
        nestedId: nestedId,
      ),
      transition: Transition.fadeIn,
      id: nestedId,
    );
  }

  static navToCountryAllMoviesPage({int nestedId}) {
    return Get.to(
      CountryAllMoviesPage(
        nestedId: nestedId,
      ),
      transition: Transition.fadeIn,
      id: nestedId,
    );
  }

  static navToTvSeriesCategoryPage({int nestedId}) {
    return Get.to(
      TvSeriesCategoryPage(
        nestedId: nestedId,
      ),
      transition: Transition.fadeIn,
      id: nestedId,
    );
  }

  static navToTvSeriesSeasonsPage({String id, int nestedId}) {
    return Get.to(
      TvSeriesSeasonsPage(
        id: id,
        nestedId: nestedId,
      ),
      transition: Transition.fadeIn,
      id: nestedId,
    );
  }

  static navToIndividualSeasonPage(
      {List<Episodes> episodes,
      String seasonTitle,
      String seriesName,
      String seriesImg,
      int nestedId}) {
    return Get.to(
      IndividualSeasonPage(
        episodes: episodes,
        seasonTitle: seasonTitle,
        seriesName: seriesName,
        seriesImg: seriesImg,
        nestedId: nestedId,
      ),
      id: nestedId,
      transition: Transition.fadeIn,
    );
  }

  static navToTvSeriesVideoDetailsPage(HomeData model,
      {Episodes episodes,
      String seriesName,
      String seasonTitle,
      int nestedId}) {
    return Get.to(
      TvSeriesVideoDetailsPage(
        episodes: episodes,
        seriesName: seriesName,
        seasonTitle: seasonTitle,
        nestedId: nestedId,
      ),
      id: nestedId,
      binding: TvSeriesVideoDetailsBindings(model),
      transition: Transition.fadeIn,
    );
  }

  static navToVideoDetailsPage(HomeData model, int nestedId, int catId) {
    RouterState.push(nestedId ?? -1, "VideoDetailsPage");
    return Get.to(
      VideoDetailsPage(
        nestedId: nestedId,
        catId: catId,
      ),
      transition: Transition.fadeIn,
      id: nestedId,
      binding: VideoDetailsBindings(model),
    );
  }

  static navToHomePage({String fragment}) {
    return Get.offAll(
      HomePage(
        page: fragment ?? HomePageFragment.dashboard,
      ),
      transition: Transition.fadeIn,
      binding: HomePageBindings(),
    );
  }

  static navToHistoryPage({int nestedId}) {
    RouterState.push(nestedId ?? -1, "HistoryPage");
    return Get.to(
      HistoryPage(
        nestedId: nestedId,
      ),
      id: nestedId,
      transition: Transition.fadeIn,
      binding: HistoryBindings(),
    );
  }

  static navToPrivacyPolicy({String privacyPolicyText}) {
    return Get.to(
      PrivacyPolicy(
        privacyPolicyText: privacyPolicyText,
      ),
      transition: Transition.fadeIn,
    );
  }

  static navToTermsOfUsePage({String termUseText}) {
    return Get.to(
      TermsOfUsePage(
        termUseText: termUseText,
      ),
      transition: Transition.fadeIn,
    );
  }

  static navToCookiePolicy({String policyText}) {
    return Get.to(
      CookiePolicy(
        policyText: policyText,
      ),
      transition: Transition.fadeIn,
    );
  }

  static exitApp() {
    exit(0);
  }
}
