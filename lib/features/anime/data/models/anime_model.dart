class AnimeModel {
  final int id;
  final String title;
  final int episodes;
  final double score;
  final String imageUrl;

  AnimeModel({
    required this.id,
    required this.title,
    required this.episodes,
    required this.score,
    required this.imageUrl,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      id: json['mal_id'] ?? 0,
      title: json['title'] ?? 'Unknown',
      episodes: json['episodes'] ?? 0,
      score: (json['score'] ?? 0).toDouble(),
      imageUrl: json['images']['jpg']['image_url'] ?? '',
    );
  }
}
