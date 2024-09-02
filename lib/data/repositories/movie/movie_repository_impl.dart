import 'package:movie_spot/app/state_management/result.dart';
import 'package:movie_spot/data/remote/app_client.dart';

import '../../../domain/repositories/movie/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final AppClient appClient;
  const MovieRepositoryImpl({required this.appClient});

  @override
  Future<Result<List<String>>> getMovies({required String name}) async {
    return Result.success(data: const ["Filme 1", "Filme 2", "Filme 3"]);
  }
}
