import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/screens/home/bloc/home_event.dart';
import 'package:movie_spot/screens/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeState _homeState = const HomeState();

  HomeBloc() : super(const HomeState()) {
    on<HomeInitEvent>(_init);
  }

  void _init(HomeInitEvent event, Emitter<HomeState> emitter) async {
    _homeState = _homeState.copyWith();
    emitter(_homeState);
  }
}
