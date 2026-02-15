import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';

/// Firma de la función que obtiene películas paginadas
typedef MovieFetcher = Future<List<Movie>> Function({int page});


/// ============================
/// NOTIFIER GENÉRICO
/// ============================
class MoviesNotifier extends Notifier<List<Movie>> {

  MoviesNotifier(this.movieType);

  final String movieType;

  int _currentPage = 0;
  bool _isLoading = false;

  @override
  List<Movie> build() {
    return [];
  }

  Future<void> loadNextPage() async {

    if (_isLoading) return;
    _isLoading = true;

    _currentPage++;

    final repository = ref.read(movieRepositoryProvider);

    late final List<Movie> movies;

    switch (movieType) {
      case 'nowPlaying':
        movies = await repository.getNowPlayng(page: _currentPage);
        break;

      case 'popular':
        movies = await repository.getPopular(page: _currentPage);
        break;

      case 'upcoming':
        movies = await repository.getUpcoming(page: _currentPage);
        break;

      case 'topRated':
        movies = await repository.getTopRated(page: _currentPage);
        break;

      default:
        movies = [];
    }

    state = [...state, ...movies];

    await Future.delayed(const Duration(milliseconds: 300));
    _isLoading = false;
  }
}

/// ============================
/// PROVIDERS
/// ============================

final nowPlayingMoviesProvider =
    NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier('nowPlaying'),
);

final popularMoviesProvider =
    NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier('popular'),
);

final upcomingMoviesProvider =
    NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier('upcoming'),
);

final topRatedMoviesProvider =
    NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier('topRated'),
);
