import 'package:os_recomienda/domain/entities/movie.dart';

abstract class MovieDataSources {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
