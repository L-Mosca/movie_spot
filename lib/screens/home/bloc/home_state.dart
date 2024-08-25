import 'package:movie_spot/app/state_management/copyable.dart';

enum HomeStatus { initial }

class HomeState implements Copyable<HomeState> {
  const HomeState({this.status = HomeStatus.initial});

  final HomeStatus status;

  @override
  HomeState copy() {
    return HomeState(status: status);
  }

  @override
  HomeState copyWith({HomeStatus? status}) {
    return HomeState(status: status ?? this.status);
  }
}
