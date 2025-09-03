class ApiUrl {
  // * ======================> Base URL <====================== * //
  static const String baseURL = "http://192.168.8.116/watch-backend/";
  // static const String baseURL = "https://just-watch.rf.gd/watch-backend/";

  // * ======================> Auth URL <====================== * //
  static const String signup = "auth/signup.php";
  static const String signin = "auth/signin.php";

  // * ======================> Movie URL <====================== * //
  static const String moviesTrending = "movie/trending.php";
  static const String moviesNowPlaying = "movie/now_playing.php";
  static const String moviesTrailer = "movie/trailer.php";
  static const String moviesRecommendation = "movie/recommendation.php";
  static const String moviesSimilar = "movie/similar.php";

  // * ======================> Tv URL <====================== * //
  static const String tvPopular = "tv/popular_tv.php";
  // static const String moviesNowPlaying = "movie/now_playing.php";
}
