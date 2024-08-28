import 'package:movie_spot/app/state_management/copyable.dart';

import '../../../../utils/constants/app_constants.dart';

enum LoginStatus { initial }

enum LoginListener { nothing, changePage }

class LoginState implements Copyable<LoginState> {
  const LoginState({
    this.status = LoginStatus.initial,
    this.listener = LoginListener.nothing,
    this.pageIndex = AppConstants.greetingsPageIndex,
  });

  final LoginStatus status;
  final LoginListener listener;
  final int pageIndex;

  @override
  LoginState copy() {
    return LoginState(
      status: status,
      listener: listener,
      pageIndex: pageIndex,
    );
  }

  @override
  LoginState copyWith({
    LoginStatus? status,
    LoginListener? listener,
    int? pageIndex,
  }) {
    return LoginState(
      status: status ?? this.status,
      listener: listener ?? this.listener,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
