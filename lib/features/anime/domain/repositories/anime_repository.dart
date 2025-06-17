import 'package:anime_flix/features/anime/domain/entities/anime.dart';

abstract class AnimeRepository {
  Future<List<Anime>> getTopAnime();
}
