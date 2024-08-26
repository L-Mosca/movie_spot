import 'package:movie_spot/app/state_management/copyable.dart';

enum LoginStatus { initial }

class LoginState implements Copyable<LoginState> {
  const LoginState({this.status = LoginStatus.initial});

  final LoginStatus status;

  @override
  LoginState copy() {
    return LoginState(status: status);
  }

  @override
  LoginState copyWith({LoginStatus? status}) {
    return LoginState(status: status ?? this.status);
  }
}
