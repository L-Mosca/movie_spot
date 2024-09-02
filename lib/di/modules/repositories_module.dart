import 'package:get/get.dart';
import 'package:movie_spot/data/remote/app_client.dart';
import 'package:movie_spot/data/repositories/movie/movie_repository_impl.dart';
import 'package:movie_spot/data/repositories/user/user_repository_impl.dart';
import 'package:movie_spot/domain/repositories/movie/movie_repository.dart';
import 'package:movie_spot/domain/repositories/user/user_repository.dart';

class RepositoriesModule {
  static void init() {
    Get.put<MovieRepository>(
      MovieRepositoryImpl(appClient: Get.find<AppClient>()),
    );

    Get.put<UserRepository>(
      UserRepositoryImpl(appClient: Get.find<AppClient>()),
    );
  }
}
