import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/router/routes/login/greetings_router.dart';
import 'package:movie_spot/router/routes/login/sign_in_router.dart';
import 'package:movie_spot/router/routes/login/sign_up_router.dart';
import 'package:movie_spot/ui/screens/login/bloc/login_bloc.dart';
import 'package:movie_spot/ui/screens/login/bloc/login_event.dart';
import 'package:movie_spot/ui/screens/login/login_page.dart';

class LoginRouter {
  const LoginRouter();

  static Widget get page {
    final loginBloc = LoginBloc();
    loginBloc.add(LoginInitEvent());

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: loginBloc),
        GreetingsRouter.page,
        SignInRouter.page,
        SignUpRouter.page,
      ],
      child: const LoginPage(),
    );
  }
}
