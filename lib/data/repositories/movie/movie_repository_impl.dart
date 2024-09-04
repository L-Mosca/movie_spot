import 'package:movie_spot/data/remote/app_client.dart';

import '../../../domain/repositories/movie/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final AppClient appClient;

  const MovieRepositoryImpl({required this.appClient});

  @override
  Future<List<String>> getMovies({required String name}) async {
    return const [
      "Filme 1",
      "Filme 2",
      "Filme 3",
      "Filme 4",
      "Filme 5",
      "Filme 6",
      "Filme 7",
      "Filme 8",
      "Filme 9",
      "Filme 10",
      "Filme 11",
      "Filme 12",
      "Filme 13",
      "Filme 14",
      "Filme 15",
    ];
  }
}
