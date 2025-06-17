import 'package:anime_flix/src/presentation/routes/app_paths.dart';
import 'package:anime_flix/src/presentation/screens/anime_detail_page.dart';
import 'package:anime_flix/src/presentation/screens/anime_list_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: AppPaths.anime,
    routes: [
      GoRoute(
        path: AppPaths.anime,
        builder: (context, state) => const AnimeListPage(),
      ),
      GoRoute(
        path: '/anime/:id',
        builder: (context, state) => AnimeDetailPage(
          animeId: int.parse(state.pathParameters['id']!),
        ),
      ),
    ],
  );
}