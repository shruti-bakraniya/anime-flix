import 'package:anime_flix/core/routes/app_paths.dart';
import 'package:anime_flix/features/anime/presentation/screens/anime_detail_screen.dart';
import 'package:anime_flix/features/anime/presentation/screens/anime_list_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: AppPaths.anime,
    routes: [
      GoRoute(
        path: AppPaths.anime,
        builder: (context, state) => const AnimeListScreen(),
      ),
      GoRoute(
        path: '/anime/:id',
        builder: (context, state) => AnimeDetailScreen(
          animeId: int.parse(state.pathParameters['id']!),
        ),
      ),
    ],
  );
}