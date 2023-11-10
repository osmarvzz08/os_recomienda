import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:os_recomienda/infrastructure/datasources/isar_datasource.dart';
import 'package:os_recomienda/infrastructure/repositories/local_storage_repository_impl.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
