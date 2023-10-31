import 'package:dio/dio.dart';
import 'package:os_recomienda/config/constants/enviironment.dart';
import 'package:os_recomienda/domain/datasource/actors_datasources.dart';
import 'package:os_recomienda/domain/entities/actor.dart';
import 'package:os_recomienda/infrastructure/mappers/actor_mapper.dart';
import 'package:os_recomienda/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Actor>> getActorByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast
        .map((cast) => ACtorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
