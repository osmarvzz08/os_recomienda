import 'package:os_recomienda/domain/entities/actor.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorByMovie(String movieId);
}
