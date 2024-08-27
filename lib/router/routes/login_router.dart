import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/ui/screens/login/bloc/login_bloc.dart';
import 'package:movie_spot/ui/screens/login/bloc/login_event.dart';
import 'package:movie_spot/ui/screens/login/greetings/bloc/greetings_bloc.dart';
import 'package:movie_spot/ui/screens/login/greetings/bloc/greetings_event.dart';
import 'package:movie_spot/ui/screens/login/login_page.dart';
import 'package:movie_spot/ui/screens/login/sign_in/bloc/sign_in_bloc.dart';
import 'package:movie_spot/ui/screens/login/sign_in/bloc/sign_in_event.dart';
import 'package:movie_spot/ui/screens/login/sign_up/bloc/sign_up_bloc.dart';
import 'package:movie_spot/ui/screens/login/sign_up/bloc/sign_up_event.dart';

class LoginRouter {
  const LoginRouter();

  static Widget get page => MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(create: (_) {
            final loginBloc = LoginBloc();
            loginBloc.add(LoginInitEvent());
            return loginBloc;
          }),
          BlocProvider<GreetingsBloc>(create: (_) {
            final greetingsBloc = GreetingsBloc();
            greetingsBloc.add(GreetingsInitEvent());
            return greetingsBloc;
          }),
          BlocProvider<SignInBloc>(create: (_) {
            final signInBloc = SignInBloc();
            signInBloc.add(SignInInitEvent());
            return signInBloc;
          }),
          BlocProvider<SignUpBloc>(create: (_) {
            final signUpBloc = SignUpBloc();
            signUpBloc.add(SignUpInitEvent());
            return signUpBloc;
          }),
        ],
        child: const LoginPage(),
      );
}
