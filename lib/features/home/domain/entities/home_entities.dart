import 'package:equatable/equatable.dart';

//ف العادي مش بستعمله بستعمل ا model  علطول
class Movie extends Equatable {
  final String backdropPath;
  final int id;
  final String title;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const Movie({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
    id,
    backdropPath,
    title,
    genreIds,
    overview,
    voteAverage,
    releaseDate,
  ];
}
