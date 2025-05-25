class ApiConstant {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '839bc23ddb4dbf4b92c353719b6b3973';

  static const String playingNowPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';

  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
