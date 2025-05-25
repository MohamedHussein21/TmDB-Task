import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tmdb_task/core/network/api_constant.dart';
import 'package:tmdb_task/core/utils/constant.dart';
import 'package:tmdb_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:tmdb_task/features/home/presentation/pages/movie_det.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.nowPlayingState == RequestState.loading) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state.nowPlayingState == RequestState.error) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Text(
                state.nowPlayingMessage,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        } else if (state.nowPlayingState == RequestState.loaded) {
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.nowPlayingMovies.length,
              itemBuilder: (context, index) {
                final item = state.nowPlayingMovies[index];
                return GestureDetector(
                  onTap: () {
                    Constants.navigateTo(
                      context,
                      MovieDetailScreen(movie: state.nowPlayingMovies[index]),
                    );
                  },
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: ApiConstant.imageUrl(item.backdropPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }

        return const SizedBox(height: 200);
      },
    );
  }
}
