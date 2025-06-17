class Anime {
  final int id;
  final String title;
  final String imageUrl;
  final int episodes;
  final double score;

  Anime({required this.id, required this.title, required this.imageUrl, required this.episodes, required this.score});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['mal_id'],
      title: json['title'],
      imageUrl: json['images']['jpg']['image_url'],
      episodes: json['episodes'] ?? 0,
      score: (json['score'] ?? 0).toDouble(),
    );
  }
}