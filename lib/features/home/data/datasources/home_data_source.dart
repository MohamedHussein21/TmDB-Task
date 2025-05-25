import 'package:dio/dio.dart';
import 'package:tmdb_task/core/errors/server_excption.dart';
import 'package:tmdb_task/core/network/api_constant.dart';
import 'package:tmdb_task/core/network/error_model.dart';
import 'package:tmdb_task/features/home/data/models/movies_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<MoviesModel>> getPlayingNowMovies();

  Future<List<MoviesModel>> getPopularMovies();

  Future<List<MoviesModel>> getTopRatedMovies();
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<List<MoviesModel>> getPlayingNowMovies() async {
    final response = await Dio().get(ApiConstant.playingNowPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map((e) => MoviesModel.fromjson(e)),
      );
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstant.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map((e) => MoviesModel.fromjson(e)),
      );
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstant.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map((e) => MoviesModel.fromjson(e)),
      );
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
