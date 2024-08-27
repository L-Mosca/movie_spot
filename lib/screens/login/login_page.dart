import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/screens/login/bloc/login_bloc.dart';
import 'package:movie_spot/screens/login/bloc/login_state.dart';
import 'package:movie_spot/screens/login/sign_in/sign_in_page.dart';
import 'package:movie_spot/screens/login/sign_up/sign_up_page.dart';

import 'greetings/greetings_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _widgetList = const [GreetingsPage(), SignInPage(), SignUpPage()];
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: _onChanged, child: Scaffold(body: _pageList()));
  }

  void _onChanged(BuildContext context, LoginState state) {}

  Widget _pageList() {
    return SafeArea(
      child: PageView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _widgetList,
      ),
    );
  }
}
