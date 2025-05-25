import 'package:dartz/dartz.dart';
import 'package:tmdb_task/core/errors/Failure.dart';
import 'package:tmdb_task/features/home/domain/entities/home_entities.dart';
import 'package:tmdb_task/features/home/domain/repositories/home_repository.dart';

class HomeUseCase {
  final BaseMovieRepository baseMovieRepository;

  HomeUseCase(this.baseMovieRepository);

  Future<Either<Failure, List<Movie>>> getPlayingNow() async {
    return await baseMovieRepository.getPlayingNow();
  }

  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    return await baseMovieRepository.getPopularMovies();
  }

  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
