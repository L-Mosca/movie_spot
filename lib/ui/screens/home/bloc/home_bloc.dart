import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/domain/repositories/movie/movie_repository.dart';
import 'package:movie_spot/ui/screens/home/bloc/home_event.dart';
import 'package:movie_spot/ui/screens/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeState _homeState = const HomeState();
  final MovieRepository movieRepository;

  HomeBloc(this.movieRepository) : super(const HomeState()) {
    on<HomeInitEvent>(_init);
  }

  void _init(HomeInitEvent event, Emitter<HomeState> emitter) async {
    _homeState = _homeState.copyWith(status: HomeStatus.loading);
    emitter(_homeState);

    await Future.delayed(const Duration(seconds: 2));

    try {
      final movieList = await movieRepository.getMovies(name: "");
      _homeState = _homeState.copyWith(
        movieList: movieList,
        status: HomeStatus.success,
      );
    } catch (e) {
      print("error");
    } finally {
      emitter(_homeState);
    }
  }
}
