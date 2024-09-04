import 'package:movie_spot/app/state_management/copyable.dart';

enum HomeStatus { initial, loading, success }

class HomeState implements Copyable<HomeState> {
  const HomeState({this.status = HomeStatus.initial, this.movieList});

  final HomeStatus status;
  final List<String>? movieList;

  @override
  HomeState copy() {
    return HomeState(
      status: status,
      movieList: movieList,
    );
  }

  @override
  HomeState copyWith({HomeStatus? status, List<String>? movieList}) {
    return HomeState(
      status: status ?? this.status,
      movieList: movieList ?? this.movieList,
    );
  }
}
