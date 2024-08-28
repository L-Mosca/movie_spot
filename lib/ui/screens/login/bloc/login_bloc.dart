import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/ui/screens/login/bloc/login_event.dart';
import 'package:movie_spot/ui/screens/login/bloc/login_state.dart';
import 'package:movie_spot/utils/constants/app_constants.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginState _loginState = const LoginState();

  LoginBloc() : super(const LoginState()) {
    on<LoginInitEvent>(_init);
    on<LoginChangePageEvent>(_changePage);
    on<LoginBackPageEvent>(_backTo);
    on<LoginResetListener>(_resetListener);
  }

  void _init(LoginInitEvent event, Emitter<LoginState> emitter) async {
    _loginState = _loginState.copyWith(status: LoginStatus.initial);
    emitter(_loginState);
  }

  void _changePage(
    LoginChangePageEvent event,
    Emitter<LoginState> emitter,
  ) async {
    final newPage = event.newIndex;
    final actualPage = _loginState.pageIndex;

    if (newPage == actualPage) return;

    _loginState = _loginState.copyWith(
      pageIndex: newPage,
      listener: LoginListener.changePage,
    );
    emitter(_loginState);
  }

  void _backTo(LoginBackPageEvent event, Emitter<LoginState> emitter) async {
    final actualPage = _loginState.pageIndex;
    int newIndex =
        (actualPage == AppConstants.greetingsPageIndex) ? -1 : actualPage - 1;

    _loginState = _loginState.copyWith(
      listener: LoginListener.changePage,
      pageIndex: newIndex,
    );

    emitter(_loginState);
  }

  void _resetListener(
    LoginResetListener event,
    Emitter<LoginState> emitter,
  ) async {
    _loginState = _loginState.copyWith(listener: LoginListener.nothing);
    emitter(_loginState);
  }
}
