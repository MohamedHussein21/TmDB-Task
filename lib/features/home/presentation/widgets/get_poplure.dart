import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tmdb_task/core/network/api_constant.dart';
import 'package:tmdb_task/core/utils/constant.dart';
import 'package:tmdb_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:tmdb_task/features/home/presentation/pages/movie_det.dart';

class PoplureMoveis extends StatelessWidget {
  const PoplureMoveis({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.popularState == RequestState.loading) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state.popularState == RequestState.error) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Text(
                state.popularMessage,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        } else if (state.popularState == RequestState.loaded) {
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.popularMovies.length,
              itemBuilder: (context, index) {
                final item = state.popularMovies[index];
                return GestureDetector(
                  onTap: () {
                    Constants.navigateTo(
                      context,
                      MovieDetailScreen(movie: item),
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
