import 'package:os_recomienda/domain/entities/actor.dart';
import 'package:os_recomienda/infrastructure/models/moviedb/credits_response.dart';

class ACtorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath}'
          : 'https://qph.cf2.quoracdn.net/main-qimg-6d72b77c81c9841bd98fc806d702e859-lq',
      character: cast.character);
}
