import 'package:movie_spot/app/state_management/copyable.dart';

enum SignInStatus { initial }

class SignInState implements Copyable<SignInState> {
  const SignInState({this.status = SignInStatus.initial});

  final SignInStatus status;

  @override
  SignInState copy() {
    return SignInState(status: status);
  }

  @override
  SignInState copyWith({SignInStatus? status}) {
    return SignInState(status: status ?? this.status);
  }
}
