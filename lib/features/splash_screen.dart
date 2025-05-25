import 'package:flutter/material.dart';
import 'package:tmdb_task/core/utils/constant.dart';
import 'package:tmdb_task/core/utils/images_mange.dart';
import 'package:tmdb_task/core/utils/mediaQuery.dart';
import 'package:tmdb_task/core/utils/text_style.dart';
import 'package:tmdb_task/features/home/presentation/pages/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(ImageAssets.splash, fit: BoxFit.cover),
          ),

          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("THE MOVIE DB", style: AppTextStyles.smallLabel),
                SizedBox(height: MediaQueryValue(context).heigh * 0.02),
                Text(
                  "Tudo sobre filmes,\nséries, animes e\nmuito mais.",
                  style: AppTextStyles.heading,
                ),
                SizedBox(height: MediaQueryValue(context).heigh * 0.02),
                Text(
                  "Fique por dentro das informações de filmes,\nséries, animes e muito mais.",
                  style: AppTextStyles.subheading,
                ),
                SizedBox(height: MediaQueryValue(context).heigh * 0.02),
                PrimaryButton(
                  title: "Acessar",
                  onPressed: () {
                    Constants.navigateAndFinish(context, const HomeScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
