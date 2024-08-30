import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/ui/screens/login/sign_up/bloc/sign_up_event.dart';
import 'package:movie_spot/ui/screens/login/sign_up/bloc/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpState _signUpState = const SignUpState();

  SignUpBloc() : super(const SignUpState()) {
    on<SignUpInitEvent>(_init);
    on<SignUpRegisterEvent>(_register);
  }

  void _init(SignUpInitEvent event, Emitter<SignUpState> emitter) async {
    _signUpState = _signUpState.copyWith(status: SignUpStatus.initial);
    emitter(_signUpState);
  }

  void _register(
    SignUpRegisterEvent event,
    Emitter<SignUpState> emitter,
  ) async {
    final username = event.username;
    final email = event.email;
    final password = event.password;
    final confirmPassword = event.confirmPassword;

    print(
        "Dados do usuário: username: $username - email: $email - password: $password - confirmPassword: $confirmPassword");
  }
}
