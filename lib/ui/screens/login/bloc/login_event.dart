abstract class LoginEvent {}

class LoginInitEvent extends LoginEvent {}

class LoginChangePageEvent extends LoginEvent {
  final int newIndex;

  LoginChangePageEvent({required this.newIndex});
}

class LoginBackPageEvent extends LoginEvent {}

class LoginResetListener extends LoginEvent {}
