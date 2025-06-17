import 'dart:async';

import 'package:anime_flix/features/anime/data/datasources/anime_remote_datasource.dart';
import 'package:anime_flix/features/anime/data/repositories/anime_repository_impl.dart';
import 'package:anime_flix/features/anime/domain/entities/anime.dart';
import 'package:anime_flix/features/anime/domain/usecases/fetch_anime_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeListNotifierProvider = AsyncNotifierProvider<AnimeListNotifier, List<Anime>>(() {
  return AnimeListNotifier();
});

class AnimeListNotifier extends AsyncNotifier<List<Anime>> {
  late final FetchAnimeList _fetchAnimeList;

  @override
  Future<List<Anime>> build() async {
    final repo = AnimeRepositoryImpl(AnimeRemoteDataSource());
    _fetchAnimeList = FetchAnimeList(repo);
    return await _fetchAnimeList();
  }
}
