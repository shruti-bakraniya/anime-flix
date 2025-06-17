class Anime {
  final int id;
  final String title;
  final String synopsis;
  final List<String> genres;
  final List<String> mainCast;
  final int episodes;
  final double rating;
  final String posterUrl;
  final String? trailerUrl;

  Anime({
    required this.id,
    required this.title,
    required this.synopsis,
    required this.genres,
    required this.mainCast,
    required this.episodes,
    required this.rating,
    required this.posterUrl,
    this.trailerUrl,
  });
}
