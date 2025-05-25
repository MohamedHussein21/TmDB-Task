import 'package:flutter/material.dart';
import 'package:tmdb_task/core/utils/color_mange.dart';

class GenreChips extends StatefulWidget {
  const GenreChips({super.key});

  @override
  State<GenreChips> createState() => _GenreChipsState();
}

class _GenreChipsState extends State<GenreChips> {
  final List<String> _genres = ['Drama', 'Thriler', 'Farah Mohap'];
  final Set<String> _selectedGenres = {'Farah Mohap'};

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children:
          _genres.map((genre) {
            final isSelected = _selectedGenres.contains(genre);

            return ChoiceChip(
              label: Text(
                genre,
                style: TextStyle(
                  color:
                      isSelected
                          ? ColorManger.blackColor
                          : ColorManger.wightColor,
                  fontSize: 14,
                ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedGenres.add(genre);
                  } else {
                    _selectedGenres.remove(genre);
                  }
                });
              },
              selectedColor: ColorManger.selctedColor,
              backgroundColor: ColorManger.unSelctedColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide.none,
              ),
            );
          }).toList(),
    );
  }
}
