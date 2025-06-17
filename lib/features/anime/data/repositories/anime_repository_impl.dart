import 'package:anime_flix/features/anime/data/datasources/anime_remote_datasource.dart';
import 'package:anime_flix/features/anime/domain/entities/anime.dart';
import 'package:anime_flix/features/anime/domain/repositories/anime_repository.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource remoteDataSource;

  AnimeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Anime>> getTopAnime() async {
    final models = await remoteDataSource.fetchTopAnime();
    return models.map((model) => Anime(
      title: model.title,
      episodes: model.episodes,
      rating: model.score,
      posterUrl: model.imageUrl,
      id: model.id,
      synopsis: '',
      genres: [],
      mainCast: [],
    )).toList();
  }
}
