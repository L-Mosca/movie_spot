import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/screens/login/greetings/bloc/greetings_bloc.dart';
import '../../../ui/screens/login/greetings/bloc/greetings_event.dart';

class GreetingsRouter {
  const GreetingsRouter();

  static BlocProvider get page => BlocProvider<GreetingsBloc>(
        create: (_) {
          final greetingsBloc = GreetingsBloc();
          greetingsBloc.add(GreetingsInitEvent());
          return greetingsBloc;
        },
      );
}
