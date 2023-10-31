import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:os_recomienda/domain/entities/actor.dart';
import 'package:os_recomienda/presentation/providers/actors/actors_repository_provider.dart';

final actorByMovieProvider =
    StateNotifierProvider<ActorByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorsRepository = ref.watch(actorRepositoryProvider);

  return ActorByMovieNotifier(getActors: actorsRepository.getActorByMovie);
});

/*
{
  '505642':<Actor>[],
  '505643':<Actor>[],
  '505645':<Actor>[],
  '501231':<Actor>[]
}
*/

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorByMovieNotifier({
    required this.getActors,
  }) : super({});

  Future<void> loadActors(movieId) async {
    if (state[movieId] != null) return;
    final List<Actor> actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
