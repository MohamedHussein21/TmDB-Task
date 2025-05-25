import 'package:dartz/dartz.dart';
import 'package:tmdb_task/core/errors/Failure.dart';
import 'package:tmdb_task/core/errors/server_excption.dart';
import 'package:tmdb_task/features/home/data/datasources/home_data_source.dart';
import 'package:tmdb_task/features/home/domain/entities/home_entities.dart';

import '../../domain/repositories/home_repository.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  MoviesRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getPlayingNow() async {
    try {
      final result = await baseRemoteDataSource.getPlayingNowMovies();
      return right(result);
    } on ServerException catch (failure) {
      return left(FailureServer(massage: failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await baseRemoteDataSource.getPopularMovies();
      return right(result);
    } on ServerException catch (failure) {
      return left(FailureServer(massage: failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final result = await baseRemoteDataSource.getTopRatedMovies();
      return right(result);
    } on ServerException catch (failure) {
      return left(FailureServer(massage: failure.errorModel.statusMessage));
    }
  }
}
