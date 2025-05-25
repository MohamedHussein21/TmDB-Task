import 'package:dartz/dartz.dart';
import 'package:tmdb_task/core/errors/Failure.dart';

import '../entities/home_entities.dart';

abstract class BaseMovieRepository {

  Future<Either<Failure,List<Movie>>> getPlayingNow ();

  Future<Either<Failure,List<Movie>>> getPopularMovies ();

  Future<Either<Failure,List<Movie>>> getTopRatedMovies ();
}