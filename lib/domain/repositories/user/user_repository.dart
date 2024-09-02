import 'package:movie_spot/data/models/user/login_body.dart';
import 'package:movie_spot/data/models/user/register_body.dart';

abstract interface class UserRepository {
  Future<void> login({required LoginBody loginBody});

  Future<void> register({required RegisterBody registerBody});
}
