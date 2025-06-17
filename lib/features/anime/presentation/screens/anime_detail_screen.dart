import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../viewmodels/anime_detail_notifier.dart';
import '../../domain/entities/anime.dart';

class AnimeDetailScreen extends ConsumerWidget {
  final int animeId;

  const AnimeDetailScreen({super.key, required this.animeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeAsync = ref.watch(animeDetailProvider(animeId));

    return Scaffold(
      appBar: AppBar(title: const Text('Anime Detail')),
      body: animeAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (anime) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (anime.trailerUrl != null)
                YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(anime.trailerUrl!)!,
                    flags: const YoutubePlayerFlags(autoPlay: false),
                  ),
                  showVideoProgressIndicator: true,
                )
              else
                Center(
                  child: Image.network(
                    anime.posterUrl,
                    height: 200,
                  ),
                ),
              const SizedBox(height: 16),
              Text(anime.title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text("Episodes: ${anime.episodes} | Rating: ${anime.rating}"),
              const SizedBox(height: 8),
              Text("Genres: ${anime.genres.join(', ')}"),
              const SizedBox(height: 8),
              Text("Main Cast: ${anime.mainCast.join(', ')}"),
              const SizedBox(height: 12),
              Text("Plot", style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(anime.synopsis),
            ],
          ),
        ),
      ),
    );
  }
}
