import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider moderno
final nowPlayingMoviesProvider =
    NotifierProvider<NowPlayingMoviesNotifier, List<Movie>>(
  NowPlayingMoviesNotifier.new,
);

class NowPlayingMoviesNotifier extends Notifier<List<Movie>> {

  int _currentPage = 0;
  late final Future<List<Movie>> Function({int page}) _fetchMoreMovies;

  @override
  List<Movie> build() {
    // 🔹 Leemos el repositorio
    final repository = ref.watch(movieRepositoryProvider);

    // 🔹 Guardamos el callback
    _fetchMoreMovies = repository.getNowPlayng;

    // 🔹 Estado inicial
    return [];
  }

  Future<void> loadNextPage() async {
    _currentPage++;

    final movies = await _fetchMoreMovies(page: _currentPage);

    // 🔹 Actualizamos el estado
    state = [...state, ...movies];
  }
}
