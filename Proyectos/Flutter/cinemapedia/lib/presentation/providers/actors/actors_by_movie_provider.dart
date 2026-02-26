import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    NotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
      ActorsByMovieNotifier.new,
    );

class ActorsByMovieNotifier extends Notifier<Map<String, List<Actor>>> {
  @override
  Map<String, List<Actor>> build() {
    // Cache vacío al inicio
    return {};
  }

  Future<void> loadActors(String movieId) async {
    // 🔴 Evita repetir llamadas
    if (state[movieId] != null) return;

    final actorsRepository = ref.read(actorsRepositoryProvider);

    final actors = await actorsRepository.getActorsByMovie(movieId);

    state = {...state, movieId: actors};
  }
}
