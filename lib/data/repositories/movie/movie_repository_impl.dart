import 'package:movie_spot/app/state_management/result.dart';

import '../../../domain/repositories/movie/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  const MovieRepositoryImpl();

  @override
  Future<Result<List<String>>> getMovies({required String name}) async {
    return Result.success(data: const ["Filme 1", "Filme 2", "Filme 3"]);
  }
}
