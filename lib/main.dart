import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_task/core/services/services_locator.dart';
import 'package:tmdb_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:tmdb_task/features/splash_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  sL<HomeCubit>()
                    ..getNowPlayingMovies()
                    ..getNowPlayingMovies()
                    ..getPopularMovies()
                    ..getTopRatedMovies()
                    ..loadFavorites(),
        ),
      ],
      child: MaterialApp(
        title: 'TMDB Movie App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
