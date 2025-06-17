import 'package:anime_flix/src/application/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AnimeListPage extends ConsumerWidget {
  const AnimeListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeList = ref.watch(animeListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Top Anime')),
      body: animeList.when(
        data: (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final anime = list[index];
            return ListTile(
              leading: Image.network(anime.imageUrl, width: 50),
              title: Text(anime.title),
              subtitle: Text('Episodes: ${anime.episodes}  |  Rating: ${anime.score}'),
              onTap: () => context.go('/anime/${anime.id}'),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text(err.toString())),
      ),
    );
  }
}