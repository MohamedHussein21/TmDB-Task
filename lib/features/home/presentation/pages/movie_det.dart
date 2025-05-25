import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_task/core/network/api_constant.dart';
import 'package:tmdb_task/core/utils/color_mange.dart';
import 'package:tmdb_task/core/utils/constant.dart';
import 'package:tmdb_task/features/home/domain/entities/home_entities.dart';
import 'package:tmdb_task/features/home/presentation/cubit/home_cubit.dart';

import '../widgets/genre_chips.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF181829),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        ApiConstant.imageUrl(movie.backdropPath),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 220,
                  color: Colors.black.withOpacity(0.4),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Voltar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            context.select<HomeCubit, bool>(
                                  (cubit) => cubit.isFavorite(movie.id),
                                )
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:
                                context.read<HomeCubit>().isFavorite(movie.id)
                                    ? Colors.red
                                    : Colors.white,
                          ),
                          onPressed: () {
                            context.read<HomeCubit>().toggleFavorite(movie.id);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.02),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${movie.title} (${movie.releaseDate.substring(0, 4)})',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorManger.buttonColor,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          //النسبة مش راجعة ف الريسبونس
                          child: Text(
                            "45%",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: ColorManger.wightColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.02),

                      //التاريخ مش راجع ف الريسبونس
                      Text(
                        "10/12/2021 (BR)",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFB0B0B0),
                        ),
                      ),
                      SizedBox(width: width * 0.02),

                      Icon(Icons.circle, size: 4, color: Color(0xFFB0B0B0)),
                      SizedBox(width: width * 0.02),

                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: Color(0xFFB0B0B0),
                      ),
                      SizedBox(width: width * 0.02),

                      Text(
                        "1h 53m",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFB0B0B0),
                        ),
                      ),
                    ],
                  ),

                  Divider(height: height * 0.02, color: ColorManger.blackColor),
                  Text(
                    movie.overview,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  PrimaryButton(title: "Assistir trailer", onPressed: () {}),

                  SizedBox(height: height * 0.03),

                  const Text(
                    'Elenco principal',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  SizedBox(
                    height: 90,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemBuilder:
                          (context, index) => Column(
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.grey[700],
                                //صور  الممثلين مش راجعة
                                // backgroundImage: NetworkImage(actorImageUrl),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Sandra Bullock',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  Divider(height: 1, color: Colors.grey[700]),
                  SizedBox(height: height * 0.02),

                  const Text(
                    'Categoria(s)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  GenreChips(),

                  SizedBox(height: height * 0.02),

                  Divider(height: 1, color: Colors.grey[700]),
                  SizedBox(height: height * 0.02),

                  const Text(
                    'Recomendações',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder:
                          (context, index) => ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              width: 90,
                              color: Colors.grey[700],
                              // child: Image.network(recommendationPosterUrl),
                            ),
                          ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
