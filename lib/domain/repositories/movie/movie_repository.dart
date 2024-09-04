abstract interface class MovieRepository {
  Future<List<String>> getMovies({required String name});
}
