import 'package:movie_spot/app/state_management/copyable.dart';

enum SplashStatus { initial }

enum SplashListener { nothing, toLogin, toHome }

class SplashState implements Copyable<SplashState> {
  const SplashState({
    this.status = SplashStatus.initial,
    this.listener = SplashListener.nothing,
  });

  final SplashStatus status;
  final SplashListener listener;

  @override
  SplashState copy() {
    return SplashState(status: status, listener: listener);
  }

  @override
  SplashState copyWith({SplashStatus? status, SplashListener? listener}) {
    return SplashState(
      status: status ?? this.status,
      listener: listener ?? this.listener,
    );
  }
}
