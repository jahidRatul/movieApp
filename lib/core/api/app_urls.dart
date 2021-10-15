class AppUrls {
  /// base url
  static String baseUrl = "https://iotait.tech/videoapp/";

  ///user
  static String registerUserUrl = baseUrl + "api/user/register";
  static String loginUserUrl = baseUrl + "api/user/login";

  static String homeBannerUrl = baseUrl + "api/home/banners";
  static String imageBaseUrl = "http://iotait.tech/videoapp/storage/";
  static String countryUrl = baseUrl + "api/country/getall";
  static String genreUrl = baseUrl + "api/genres";
  static String actorUrl = baseUrl + "api/actor/getAll";
  static String actorsMoviesUrl = baseUrl + "api/actor/videos/";

  static String sponsorUrl = baseUrl + "api/sponsors";
  static String allVideosUrl = baseUrl + "api/videos";
  static String likeUrl = baseUrl + "api/video/like";
  static String dislikeUrl = baseUrl + "api/video/dislike";
  static String categoriesUrl = baseUrl + "api/categories/andorid/video";
  static String categoryMayLike = baseUrl + "api/category/maylike?id=";
  static String subCategoriesUrl = baseUrl + "api/categories/subcategory/";
  static String subCategoriesAllVideosUrl = baseUrl + "api/subcategory/video/";
  static String tvSeriesUrl = baseUrl + "api/series";
  static String homeCategoriesUrl = baseUrl + "api/home/videos";
  static String videoDetailsUrl = baseUrl + "api/videos/";
  static String settingsUrl = baseUrl + "api/settings";
  static String genreAllMoviesUrl = baseUrl + "api/genres/videos/";
  static String countryAllMoviesUrl = baseUrl + "api/country/videos/";
  static String logoutUserUrl = baseUrl + "api/user/logout";
  static String profileUrl = baseUrl + "api/user/me";
  static String updateProfileUrl = baseUrl + "api/user/update";
  static String historyUrl = baseUrl + "api/user/hirstory";
  static String addReportsUrl = baseUrl + "api/report";
  static String tvSeriesSeasonsUrl = baseUrl + "api/series/episodes/";
  static String feedbackUrl = baseUrl + "api/feedback";

  static String filterVideoUrl({int totalLike, String time, int resolution}) =>
      baseUrl +
      "api/video/filter?total_like=$totalLike&upload_type=$time&resolution=$resolution";
  static String tvSeriesSeasonEpisodeUrl =
      baseUrl + "api/series/suggestion/withfilter";

  ///wishList
  static String wishListAllUrl = baseUrl + "api/wishlist/getall";
  static String wishListSingleDeleteUrl = baseUrl + "api/wishlist/delete/";
  static String addWishList = baseUrl + "api/wishlist";

  ///video view
  static String addToHistoryUrl = baseUrl + "api/view/add";
  static String deleteSingleHistory =
      baseUrl + "api/user/historysingle/delete/";

  ///search
  static String searchSuggestion = "$baseUrl" + "api/search/suggestions";
  static String searchResult = "$baseUrl" + "api/search/results";
}
