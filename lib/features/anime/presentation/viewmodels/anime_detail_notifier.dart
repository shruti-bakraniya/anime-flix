import 'package:anime_flix/features/anime/data/datasources/anime_remote_datasource.dart';
import 'package:anime_flix/features/anime/domain/entities/anime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeDetailProvider = AsyncNotifierProvider.family<AnimeDetailNotifier, Anime, int>(
  AnimeDetailNotifier.new,
);

class AnimeDetailNotifier extends FamilyAsyncNotifier<Anime, int> {
  @override
  Future<Anime> build(int animeId) async {
    final dataSource = AnimeRemoteDataSource();
    final model = await dataSource.fetchAnimeDetail(animeId);
    return Anime(
      id: model.id,
      title: model.title,
      synopsis: model.synopsis,
      genres: model.genres,
      mainCast: model.mainCast,
      episodes: model.episodes,
      rating: model.rating,
      posterUrl: model.posterUrl,
      trailerUrl: model.trailerUrl,
    );
  }
}
