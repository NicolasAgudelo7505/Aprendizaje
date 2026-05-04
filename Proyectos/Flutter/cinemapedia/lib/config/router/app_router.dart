import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/home_views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => HomeScreen(childView:navigationShell ,
      child: navigationShell),
      branches: <StatefulShellBranch>[
        
        // Primera Rama: Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeView(),
              routes: [
                GoRoute(
                  path: 'movie/:id',
                  name: MovieScreen.name,
                  builder: (_, state) {
                    final movieID = state.pathParameters['id'] ?? 'no-id';
                    return MovieScreen(movieId: movieID);
                  },
                ),
              ],
            ),
          ],
        ),

        // Segunda Rama: Categorías (o Favoritos duplicado según tu imagen)
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites', // Aquí podrías cambiarlo a /categories más adelante
              builder: (context, state) => const FavoritesView(),
            ),
          ],
        ),

        // Tercera Rama: Favoritos
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const FavoritesView(),
            ),
          ],
        ),

      ],
    ),
  ],
);