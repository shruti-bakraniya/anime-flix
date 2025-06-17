import 'package:anime_flix/src/data/models/anime_detail_model.dart';
import 'package:anime_flix/src/data/models/anime_model.dart';
import 'package:dio/dio.dart';

class AnimeRepository {
  Future<List<Anime>> fetchTopAnime() async {
    final res = await Dio().get('https://api.jikan.moe/v4/top/anime');
    final data = res.data;
    return (data['data'] as List).map((e) => Anime.fromJson(e)).toList();
  }

  Future<AnimeDetail> fetchAnimeDetail(int id) async {
    final res = await Dio().get('https://api.jikan.moe/v4/anime/$id');
    final data = res.data;
    return AnimeDetail.fromJson(data['data']);
  }
}