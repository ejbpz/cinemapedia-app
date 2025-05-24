import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorByMovieProvider = StateNotifierProvider<ActorsNotifier, Map<String, List<Actor>>>((ref) {
  final fetchActors = ref.watch(actorRepositoryProvider).getActorsByMovie;
  return ActorsNotifier(loadCast: fetchActors);
});

typedef GetActorCallback = Future<List<Actor>> Function(String id);

class ActorsNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorCallback loadCast;
  bool isLoading = false;

  ActorsNotifier({required this.loadCast}): super({});

  Future<void> loadActors(String id) async {
    if(state[id] != null) return;
    if(isLoading) return;

    isLoading = true;
    
    final List<Actor> actors = await loadCast(id);
    state = {...state, id: actors};

    isLoading = false;
  }
}