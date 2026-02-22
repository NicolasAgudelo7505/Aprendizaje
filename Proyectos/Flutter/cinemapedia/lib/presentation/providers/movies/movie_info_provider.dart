import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider =NotifierProvider<MovieMapNotifier, Map<String, Movie>>(
  MovieMapNotifier.new,
);

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends Notifier<Map<String, Movie>> {

  @override
  Map<String, Movie> build() {
    // estado inicial: cache vacío
    return {};
  }

  Future<void> loadMovie(String movieId) async {

    if (state[movieId] != null) return;

    final movieRepository = ref.read(movieRepositoryProvider);
    print('Realizando petición http');

    final movie = await movieRepository.getMovieById(movieId);

    state = {
      ...state,
      movieId: movie,
    };
  }
}