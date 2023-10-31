import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:os_recomienda/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:os_recomienda/infrastructure/repositories/actor_repository_impl.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});
