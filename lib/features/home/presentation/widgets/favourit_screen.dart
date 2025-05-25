import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_task/core/utils/constant.dart';
import 'package:tmdb_task/features/home/data/models/movies_model.dart';
import 'package:tmdb_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:tmdb_task/features/home/presentation/pages/movie_det.dart';

import '../../../../core/network/api_constant.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  const FavoriteMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.favoriteMovieIds.isEmpty) {
          return Scaffold(
            backgroundColor: const Color(0xFF181829),
            appBar: AppBar(
              title: const Text(
                'المفضلة',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            body: const Center(
              child: Text(
                'لا توجد أفلام مفضلة',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }

        final allMovies = [
          ...state.nowPlayingMovies,
          ...state.popularMovies,
          ...state.topRatedMovies,
        ];

        final uniqueMoviesMap = <int, MoviesModel>{};

        for (var movie in allMovies) {
          uniqueMoviesMap[movie.id] = movie as MoviesModel;
        }

        final uniqueMovies = uniqueMoviesMap.values.toList();

        final favoriteMovies =
            uniqueMovies
                .where((movie) => state.favoriteMovieIds.contains(movie.id))
                .toList();

        return Scaffold(
          backgroundColor: const Color(0xFF181829),
          appBar: AppBar(
            title: const Text('المفضلة', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: ListView.builder(
            itemCount: favoriteMovies.length,
            itemBuilder: (context, index) {
              final movie = favoriteMovies[index];
              return ListTile(
                leading: Image.network(
                  ApiConstant.imageUrl(movie.backdropPath),
                  width: 60,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  movie.title,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  movie.releaseDate,
                  style: const TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Constants.navigateTo(
                    context,
                    MovieDetailScreen(movie: movie),
                  );
                },
                trailing: IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    context.read<HomeCubit>().toggleFavorite(movie.id);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
