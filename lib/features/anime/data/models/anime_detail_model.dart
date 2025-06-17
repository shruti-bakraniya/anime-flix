class AnimeDetailModel {
  final String title;
  final int episodes;
  final int id;
  final String synopsis;
  final double rating;
  final String posterUrl;
  final String trailerUrl;
  final List<String> genres;
  final List<String> mainCast;

  AnimeDetailModel({
    required this.title,
    required this.episodes,
    required this.id,
    required this.synopsis,
    required this.rating,
    required this.posterUrl,
    required this.trailerUrl,
    required this.genres,
    required this.mainCast,
  });
}
