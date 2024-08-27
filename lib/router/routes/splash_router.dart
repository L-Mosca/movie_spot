import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/screens/splash/bloc/splash_event.dart';
import 'package:movie_spot/screens/splash/splash_page.dart';

import '../../screens/splash/bloc/splash_bloc.dart';

class SplashRouter {
  SplashRouter();

  static Widget get page => BlocProvider<SplashBloc>(
        create: (context) {
          final splashBloc = SplashBloc();
          splashBloc.add(SplashInitEvent(context: context));
          return splashBloc;
        },
        child: const SplashPage(),
      );
}
