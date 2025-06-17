import 'dart:developer';

import 'package:anime_flix/src/application/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class AnimeDetailPage extends ConsumerStatefulWidget {
  final int animeId;
  const AnimeDetailPage({super.key, required this.animeId});

  @override
  ConsumerState<AnimeDetailPage> createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends ConsumerState<AnimeDetailPage> {
  VideoPlayerController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final detail = ref.watch(animeDetailProvider(widget.animeId));

    return Scaffold(
      appBar: AppBar(title: const Text('Anime Details')),
      body: detail.when(
        data: (anime) {
          if (anime.trailerUrl != null) {
            _controller ??= VideoPlayerController.networkUrl(Uri.parse(anime.trailerUrl!))
              ..initialize().then((_) => setState(() {}));
          }

          log("KDEBUG:: trailerUrl: ${anime.trailerUrl}");

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _controller != null && _controller!.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                )
                    : Image.network(anime.imageUrl),
                const SizedBox(height: 16),
                Text(anime.title, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text('Episodes: ${anime.episodes}'),
                Text('Rating: ${anime.score}'),
                const SizedBox(height: 8),
                Text('Genres: ${anime.genres.join(", ")}'),
                const SizedBox(height: 16),
                Text(anime.synopsis),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text(err.toString())),
      ),
    );
  }
}