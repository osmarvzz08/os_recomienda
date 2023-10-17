import 'package:dio/dio.dart';
import 'package:os_recomienda/config/constants/enviironment.dart';
import 'package:os_recomienda/domain/datasource/movies_datasource.dart';
import 'package:os_recomienda/domain/entities/movie.dart';
import 'package:os_recomienda/infrastructure/mappers/movie_mapper.dart';
import 'package:os_recomienda/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MovieDataSources {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final movieDBResponse = MovieDbMoviesResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-porter')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }
}
