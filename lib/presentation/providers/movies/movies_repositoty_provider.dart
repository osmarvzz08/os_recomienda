import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:os_recomienda/infrastructure/datasources/moviedb_datasource.dart';
import 'package:os_recomienda/infrastructure/repositories/movie_repository_impl.dart';

//este repositorio en inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
