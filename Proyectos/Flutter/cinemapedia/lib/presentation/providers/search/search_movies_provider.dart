import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// --- 1. SEARCH QUERY PROVIDER (Antes era StateProvider) ---
class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void updateQuery(String query) {
    state = query;
  }
}

final searchQueryProvider = NotifierProvider<SearchQueryNotifier, String>(() {
  return SearchQueryNotifier();
});


// --- 2. SEARCHED MOVIES PROVIDER (Antes era StateNotifierProvider) ---
class SearchedMoviesNotifier extends Notifier<List<Movie>> {
  
  @override
  List<Movie> build() {
    return []; // Estado inicial
  }

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    // Obtenemos el repositorio desde el ref del Notifier
    final movieRepository = ref.read(movieRepositoryProvider);
    
    final List<Movie> movies = await movieRepository.searchMovies(query);
    
    // Actualizamos el query en el otro provider
    ref.read(searchQueryProvider.notifier).updateQuery(query);

    state = movies; // Actualizamos el estado de este notifier
    return movies;
  }
}

final searchedMoviesProvider = NotifierProvider<SearchedMoviesNotifier, List<Movie>>(() {
  return SearchedMoviesNotifier();
});