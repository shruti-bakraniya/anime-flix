import 'package:anime_flix/features/anime/domain/entities/anime.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimeTile extends StatelessWidget {
  final Anime anime;

  const AnimeTile({
    super.key,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            anime.posterUrl,
            width: 50,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(anime.title),
        subtitle: Text('${anime.episodes} episodes\nRating: ${anime.rating}'),
        isThreeLine: true,
        contentPadding: const EdgeInsets.all(12),
        onTap: () {
          context.push('/anime/${anime.id}');
        },
      ),
    );
  }
}
