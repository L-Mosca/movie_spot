import 'package:movie_spot/app/state_management/copyable.dart';

enum GreetingsStatus { initial }

enum GreetingsListener { nothing }

class GreetingsState implements Copyable<GreetingsState> {
  const GreetingsState({
    this.status = GreetingsStatus.initial,
    this.listener = GreetingsListener.nothing,
  });

  final GreetingsStatus status;
  final GreetingsListener listener;

  @override
  GreetingsState copy() {
    return GreetingsState(status: status, listener: listener);
  }

  @override
  GreetingsState copyWith({
    GreetingsStatus? status,
    GreetingsListener? listener,
  }) {
    return GreetingsState(
      status: status ?? this.status,
      listener: listener ?? this.listener,
    );
  }
}
