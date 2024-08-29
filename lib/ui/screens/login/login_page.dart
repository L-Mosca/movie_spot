import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/ui/screens/login/bloc/login_bloc.dart';
import 'package:movie_spot/ui/screens/login/bloc/login_event.dart';
import 'package:movie_spot/ui/screens/login/bloc/login_state.dart';
import 'package:movie_spot/ui/screens/login/sign_in/sign_in_page.dart';
import 'package:movie_spot/ui/screens/login/sign_up/sign_up_page.dart';
import 'package:movie_spot/utils/constants/app_constants.dart';

import 'greetings/greetings_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _widgetList = [
    const GreetingsPage(),
    const SignInPage(),
    const SignUpPage()
  ];
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    context.read<LoginBloc>().add(LoginInitEvent());
    return BlocListener<LoginBloc, LoginState>(
      listener: _onChanged,
      child: Scaffold(body: _pageContent()),
    );
  }

  void _onChanged(BuildContext context, LoginState state) {
    if (state.listener == LoginListener.changePage) {
      _changePage(state.pageIndex);
      context.read<LoginBloc>().add(LoginResetListener());
    }
  }

  Widget _pageContent() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      final isFirstPage = state.pageIndex == AppConstants.greetingsPageIndex;

      return SafeArea(
        child: PopScope(
          onPopInvokedWithResult: _didPop,
          canPop: isFirstPage,
          child: _pageList(),
        ),
      );
    });
  }

  Widget _pageList() {
    return PageView(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: _widgetList,
    );
  }

  void _didPop(bool didPop, Object? data) {
    if (didPop) return;
    _backToPreviousPage();
  }

  void _changePage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _backToPreviousPage() {
    context.read<LoginBloc>().add(LoginBackPageEvent());
  }
}
