import 'package:flutter/material.dart';

class MoviesImage extends StatelessWidget {
  final String imagePath;

  const MoviesImage(this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}
