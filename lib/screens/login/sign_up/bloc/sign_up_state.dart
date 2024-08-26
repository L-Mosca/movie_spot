import 'package:movie_spot/app/state_management/copyable.dart';

enum SignUpStatus { initial }

class SignUpState implements Copyable<SignUpState> {
  const SignUpState({this.status = SignUpStatus.initial});

  final SignUpStatus status;

  @override
  SignUpState copy() {
    return SignUpState(status: status);
  }

  @override
  SignUpState copyWith({SignUpStatus? status}) {
    return SignUpState(status: status ?? this.status);
  }
}
