import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_task/features/home/domain/entities/home_entities.dart';
import 'package:tmdb_task/features/home/domain/usecases/home_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase homeUseCase;

  HomeCubit({required this.homeUseCase}) : super(const HomeState());

  void getNowPlayingMovies() async {
    emit(state.copyWith(nowPlayingState: RequestState.loading));
    final result = await homeUseCase.getPlayingNow();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: failure.toString(),
          ),
        );
      },
      (movies) {
        emit(
          state.copyWith(
            nowPlayingMovies: movies,
            nowPlayingState: RequestState.loaded,
          ),
        );
      },
    );
  }

  void getPopularMovies() async {
    emit(state.copyWith(popularState: RequestState.loading));
    final result = await homeUseCase.getPopularMovies();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            popularState: RequestState.error,
            popularMessage: failure.toString(),
          ),
        );
      },
      (movies) {
        emit(
          state.copyWith(
            popularMovies: movies,
            popularState: RequestState.loaded,
          ),
        );
      },
    );
  }

  void getTopRatedMovies() async {
    emit(state.copyWith(topRatedState: RequestState.loading));
    final result = await homeUseCase.getTopRatedMovies();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: failure.toString(),
          ),
        );
      },
      (movies) {
        emit(
          state.copyWith(
            topRatedMovies: movies,
            topRatedState: RequestState.loaded,
          ),
        );
      },
    );
  }

  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('favorites') ?? [];
    emit(state.copyWith(favoriteMovieIds: saved.map(int.parse).toSet()));
  }

  void toggleFavorite(int movieId) async {
    final prefs = await SharedPreferences.getInstance();
    final current = Set<int>.from(state.favoriteMovieIds);

    if (current.contains(movieId)) {
      current.remove(movieId);
    } else {
      current.add(movieId);
    }

    await prefs.setStringList(
      'favorites',
      current.map((id) => id.toString()).toList(),
    );

    emit(state.copyWith(favoriteMovieIds: current));
  }

  bool isFavorite(int movieId) => state.favoriteMovieIds.contains(movieId);

  Movie? getMovieById(int id) {
    try {
      return state.nowPlayingMovies.firstWhere((movie) => movie.id == id);
    } catch (_) {}

    try {
      return state.popularMovies.firstWhere((movie) => movie.id == id);
    } catch (_) {}

    try {
      return state.topRatedMovies.firstWhere((movie) => movie.id == id);
    } catch (_) {}

    return null;
  }
}
