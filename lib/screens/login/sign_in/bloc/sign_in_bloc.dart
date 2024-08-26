import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/screens/login/sign_in/bloc/sign_in_event.dart';
import 'package:movie_spot/screens/login/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInState _signInState = const SignInState();

  SignInBloc() : super(const SignInState()) {
    on<SignInInitEvent>(_init);
  }

  void _init(SignInInitEvent event, Emitter<SignInState> emitter) async {
    _signInState = _signInState.copyWith(status: SignInStatus.initial);
    emitter(_signInState);
  }
}
