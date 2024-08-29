abstract class SignInEvent {}

class SignInInitEvent extends SignInEvent {}

class SignInLoginEvent extends SignInEvent {
  final String email;
  final String password;

  SignInLoginEvent({required this.email, required this.password});
}
