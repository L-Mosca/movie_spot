abstract class SignUpEvent {}

class SignUpInitEvent extends SignUpEvent {}

class SignUpRegisterEvent extends SignUpEvent {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpRegisterEvent({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}
