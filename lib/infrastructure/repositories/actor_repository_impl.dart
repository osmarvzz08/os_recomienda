import 'package:os_recomienda/domain/datasource/actors_datasources.dart';
import 'package:os_recomienda/domain/entities/actor.dart';
import 'package:os_recomienda/domain/repository/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;
  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorByMovie(String movieId) {
    return datasource.getActorByMovie(movieId);
  }
}
