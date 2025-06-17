import 'package:anime_flix/features/anime/domain/entities/anime.dart';
import 'package:anime_flix/features/anime/domain/repositories/anime_repository.dart';

class FetchAnimeList {
  final AnimeRepository repository;

  FetchAnimeList(this.repository);

  Future<List<Anime>> call() async {
    return await repository.getTopAnime();
  }
}
