import 'dart:developer';

import 'package:anime_flix/features/anime/data/models/anime_detail_model.dart';
import 'package:anime_flix/features/anime/data/models/anime_model.dart';
import 'package:dio/dio.dart';

class AnimeRemoteDataSource {
  Future<List<AnimeModel>> fetchTopAnime() async {
    try {
      final response = await Dio().get('https://api.jikan.moe/v4/top/anime');

      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> animeList = data['data'];
        return animeList.map((e) => AnimeModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch top anime');
      }
    } catch (e) {
      throw Exception('Failed to fetch top anime');
    }
  }

  Future<AnimeDetailModel> fetchAnimeDetail(int id) async {
    final detailRes = await Dio().get('https://api.jikan.moe/v4/anime/$id/full');
    final characterRes = await Dio().get('https://api.jikan.moe/v4/anime/$id/characters');

    if (detailRes.statusCode == 200 && characterRes.statusCode == 200) {
      final detailJson = detailRes.data['data'];
      final characterJson = characterRes.data['data'];

      final genres = (detailJson['genres'] as List).map((g) => g['name'] as String).toList();
      final cast = characterJson
          .where((char) => char['voice_actors'] != null && char['voice_actors'].isNotEmpty)
          .take(5)
          .map((char) => char['character']['name'] as String)
          .toList();
      log("KDEBUG:: genres: $genres");
      log("KDEBUG:: cast: $cast");

      return AnimeDetailModel(
        id: detailJson['mal_id'],
        title: detailJson['title'],
        synopsis: detailJson['synopsis'] ?? '',
        episodes: detailJson['episodes'] ?? 0,
        rating: (detailJson['score'] ?? 0).toDouble(),
        posterUrl: detailJson['images']['jpg']['image_url'],
        trailerUrl: detailJson['trailer']['url'],
        genres: genres,
        mainCast: cast as List<String>,
      );
    } else {
      throw Exception('Failed to fetch anime details');
    }
  }

}
