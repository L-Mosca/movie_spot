import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/screens/home/bloc/home_bloc.dart';
import 'package:movie_spot/screens/home/bloc/home_event.dart';
import 'package:movie_spot/screens/home/home_page.dart';

class HomeRouter {
  const HomeRouter();

  static Widget get page => BlocProvider<HomeBloc>(
        create: (context) {
          final homeBloc = HomeBloc();
          homeBloc.add(HomeInitEvent());
          return homeBloc;
        },
        child: const HomePage(),
      );
}
