import 'package:anime_flix/src/data/models/anime_detail_model.dart';
import 'package:anime_flix/src/data/models/anime_model.dart';
import 'package:anime_flix/src/data/repositories/anime_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeRepoProvider = Provider((ref) => AnimeRepository());

final animeListProvider = FutureProvider<List<Anime>>((ref) async {
  return ref.watch(animeRepoProvider).fetchTopAnime();
});

final animeDetailProvider = FutureProvider.family<AnimeDetail, int>((ref, id) async {
  return ref.watch(animeRepoProvider).fetchAnimeDetail(id);
});