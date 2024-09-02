import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/data/models/user/register_body.dart';
import 'package:movie_spot/domain/repositories/user/user_repository.dart';
import 'package:movie_spot/ui/screens/login/sign_up/bloc/sign_up_event.dart';
import 'package:movie_spot/ui/screens/login/sign_up/bloc/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;
  SignUpState _signUpState = const SignUpState();

  SignUpBloc(this.userRepository) : super(const SignUpState()) {
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
    final registerBody = RegisterBody(
      username: event.username,
      email: event.email,
      password: event.password,
      confirmPassword: event.confirmPassword,
    );

    await userRepository.register(registerBody: registerBody);
  }
}
