abstract class MovieRepository {
  Future<List<MovieRepository>> getNowPlaying({int page = 1});
}
