import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/screens/login/bloc/login_event.dart';
import 'package:movie_spot/screens/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginState _loginState = const LoginState();

  LoginBloc() : super(const LoginState()) {
    on<LoginInitEvent>(_init);
  }

  void _init(LoginInitEvent event, Emitter<LoginState> emitter) async {
    _loginState = _loginState.copyWith(status: LoginStatus.initial);
    emitter(_loginState);
  }
}