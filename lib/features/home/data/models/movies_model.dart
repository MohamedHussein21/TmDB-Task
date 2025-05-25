import '../../domain/entities/home_entities.dart';

class MoviesModel extends Movie {
  const MoviesModel({
    required super.backdropPath,
    required super.id,
    required super.title,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MoviesModel.fromjson(Map<String, dynamic> json) {
    return MoviesModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      title: json['title'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date'],
    );
  }
}
