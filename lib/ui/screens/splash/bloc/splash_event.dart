import 'package:flutter/cupertino.dart';

abstract class SplashEvent {}

class SplashInitEvent extends SplashEvent {
  final BuildContext context;

  SplashInitEvent({required this.context});
}
