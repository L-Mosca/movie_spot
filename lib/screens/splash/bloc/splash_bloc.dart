import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/screens/splash/bloc/splash_event.dart';
import 'package:movie_spot/screens/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashState _splashState = const SplashState();

  SplashBloc() : super(const SplashState()) {
    on<SplashInitEvent>(_init);
  }

  void _init(SplashInitEvent event, Emitter<SplashState> emitter) async {
    await Future.delayed(const Duration(seconds: 2));
    _splashState = _splashState.copyWith(listener: SplashListener.toLogin);
    emitter(_splashState);
  }
}
