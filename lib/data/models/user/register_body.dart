class RegisterBody {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterBody({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  String toString() {
    return 'RegisterBody{username: $username, email: $email, password: $password, confirmPassword: $confirmPassword}';
  }
}
