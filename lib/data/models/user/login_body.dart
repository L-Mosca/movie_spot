class LoginBody {
  final String email;
  final String password;

  LoginBody({required this.email, required this.password});

  @override
  String toString() {
    return 'LoginBody{email: $email, password: $password}';
  }
}
