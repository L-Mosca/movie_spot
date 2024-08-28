import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/ui/screens/login/greetings/bloc/greetings_event.dart';
import 'package:movie_spot/ui/screens/login/greetings/bloc/greetings_state.dart';

class GreetingsBloc extends Bloc<GreetingsEvent, GreetingsState> {
  GreetingsState _greetingsState = const GreetingsState();

  GreetingsBloc() : super(const GreetingsState()) {
    on<GreetingsInitEvent>(_init);
    on<GreetingsResetListener>(_resetListener);
  }

  void _init(GreetingsInitEvent event, Emitter<GreetingsState> emitter) async {
    _greetingsState = _greetingsState.copyWith(status: GreetingsStatus.initial);
    emitter(_greetingsState);
  }

  void _resetListener(
    GreetingsResetListener listener,
    Emitter<GreetingsState> emitter,
  ) async {
    _greetingsState = _greetingsState.copyWith(
      listener: GreetingsListener.nothing,
    );
    emitter(_greetingsState);
  }
}
