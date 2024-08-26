import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/screens/login/bloc/login_bloc.dart';
import 'package:movie_spot/screens/login/bloc/login_event.dart';
import 'package:movie_spot/screens/login/login_page.dart';
import 'package:movie_spot/screens/login/sign_in/bloc/sign_in_bloc.dart';
import 'package:movie_spot/screens/login/sign_in/bloc/sign_in_event.dart';
import 'package:movie_spot/screens/login/sign_up/bloc/sign_up_bloc.dart';
import 'package:movie_spot/screens/login/sign_up/bloc/sign_up_event.dart';

class LoginRouter {
  const LoginRouter();

  static Widget get page => MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(create: (_) {
            final loginBloc = LoginBloc();
            loginBloc.add(LoginInitEvent());
            return loginBloc;
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
