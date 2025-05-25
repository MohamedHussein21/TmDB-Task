import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_task/core/services/services_locator.dart';
import 'package:tmdb_task/core/utils/color_mange.dart';
import 'package:tmdb_task/core/utils/images_mange.dart';
import 'package:tmdb_task/core/utils/mediaQuery.dart';
import 'package:tmdb_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:tmdb_task/features/home/presentation/widgets/category_chip.dart';
import 'package:tmdb_task/features/home/presentation/widgets/favourit_screen.dart';
import 'package:tmdb_task/features/home/presentation/widgets/get_now_playing.dart';
import 'package:tmdb_task/features/home/presentation/widgets/get_poplure.dart';

import '../widgets/CustomSearchField.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  String selectedCategory = 'Filmes';
  final List<String> categories = ['Filmes', 'Séries', 'Animes', 'Novelas'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              sL<HomeCubit>()
                ..getNowPlayingMovies()
                ..getPopularMovies()
                ..getTopRatedMovies(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: ColorManger.backgroundGradient),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(MediaQueryValue(context).toPadding * 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "O que você quer\nassistir hoje?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(ImageAssets.profile),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQueryValue(context).heigh * 0.03),
                  Row(
                    children: [
                      Expanded(
                        child: CustomSearchField(
                          controller: searchController,
                          onChanged: (value) {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: Text(
                          "Favoritos",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const FavoriteMoviesScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: MediaQueryValue(context).heigh * 0.03),

                  SizedBox(
                    height: 36,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            categories.map((category) {
                              return CategoryChip(
                                label: category,
                                isActive: selectedCategory == category,
                                onTap: () {
                                  setState(() {
                                    selectedCategory = category;
                                  });
                                },
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQueryValue(context).heigh * 0.03),
                  NowPlayingComponent(),
                  SizedBox(height: MediaQueryValue(context).heigh * 0.03),

                  const Text(
                    "Mais populares",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: MediaQueryValue(context).heigh * 0.02),

                  PoplureMoveis(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
