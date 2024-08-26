import '../../../core/result.dart';

abstract interface class MovieRepository {
  Future<Result<List<String>>> getMovies({required String name});
}
