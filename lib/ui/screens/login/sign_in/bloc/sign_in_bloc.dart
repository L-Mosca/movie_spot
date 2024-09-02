import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/data/models/user/login_body.dart';
import 'package:movie_spot/domain/repositories/user/user_repository.dart';
import 'package:movie_spot/ui/screens/login/sign_in/bloc/sign_in_event.dart';
import 'package:movie_spot/ui/screens/login/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository userRepository;
  SignInState _signInState = const SignInState();

  SignInBloc(this.userRepository) : super(const SignInState()) {
    on<SignInInitEvent>(_init);
    on<SignInLoginEvent>(_doLogin);
  }

  void _init(SignInInitEvent event, Emitter<SignInState> emitter) async {
    _signInState = _signInState.copyWith(status: SignInStatus.initial);
    emitter(_signInState);
  }

  void _doLogin(SignInLoginEvent event, Emitter<SignInState> emitter) async {
    final body = LoginBody(email: event.email, password: event.password);
    userRepository.login(loginBody: body);
  }
}
