class AnimeDetail {
  final String title;
  final String synopsis;
  final String? trailerUrl;
  final List<String> genres;
  final List<String> mainCast;
  final int episodes;
  final double score;
  final String imageUrl;

  AnimeDetail({
    required this.title,
    required this.synopsis,
    required this.trailerUrl,
    required this.genres,
    required this.mainCast,
    required this.episodes,
    required this.score,
    required this.imageUrl,
  });

  factory AnimeDetail.fromJson(Map<String, dynamic> json) {
    return AnimeDetail(
      title: json['title'],
      synopsis: json['synopsis'] ?? '',
      trailerUrl: json['trailer']?['url'],
      genres: (json['genres'] as List).map((e) => e['name'] as String).toList(),
      mainCast: [],
      episodes: json['episodes'] ?? 0,
      score: (json['score'] ?? 0).toDouble(),
      imageUrl: json['images']['jpg']['image_url'],
    );
  }
}