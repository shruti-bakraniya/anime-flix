import 'package:anime_flix/features/anime/presentation/viewmodels/anime_list_notifier.dart';
import 'package:anime_flix/features/anime/presentation/widgets/anime_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeListScreen extends ConsumerWidget {
  const AnimeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeListState = ref.watch(animeListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Anime'),
      ),
      body: animeListState.when(
        data: (animeList) => ListView.builder(
          itemCount: animeList.length,
          itemBuilder: (context, index) => AnimeTile(
            anime: animeList[index],
          ),
        ),
        error: (e, _) => Center(
          child: Text('Error: $e'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
