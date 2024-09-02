import 'package:flutter/foundation.dart';
import 'package:movie_spot/data/models/user/login_body.dart';
import 'package:movie_spot/data/models/user/register_body.dart';
import 'package:movie_spot/data/remote/app_client.dart';
import 'package:movie_spot/domain/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final AppClient appClient;

  UserRepositoryImpl({required this.appClient});

  @override
  Future<void> login({required LoginBody loginBody}) async {
    if (kDebugMode) {
      print("teste de dados no repository: email: ${loginBody.email}\n");
      print("teste de dados no repository: password: ${loginBody.password}\n");
    }
  }

  @override
  Future<void> register({required RegisterBody registerBody}) async {
    if (kDebugMode) {
      print("teste de dados no repository: username: ${registerBody.username}\n");
      print("teste de dados no repository: username: ${registerBody.email}\n");
      print("teste de dados no repository: username: ${registerBody.password}\n");
      print("teste de dados no repository: username: ${registerBody.confirmPassword}");
    }
  }
}
