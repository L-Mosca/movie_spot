import '../../../app/state_management/result.dart';

abstract interface class MovieRepository {
  Future<Result<List<String>>> getMovies({required String name});
}
