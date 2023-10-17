import 'package:os_recomienda/domain/datasource/movies_datasource.dart';
import 'package:os_recomienda/domain/entities/movie.dart';
import 'package:os_recomienda/domain/repository/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MovieDataSources datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
