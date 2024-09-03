import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/router/app_router.dart';
import 'package:movie_spot/router/routes/home/home_router.dart';
import 'package:movie_spot/ui/screens/login/greetings/bloc/greetings_bloc.dart';
import 'package:movie_spot/ui/screens/login/greetings/bloc/greetings_state.dart';
import 'package:movie_spot/ui/screens/login/greetings/widgets/greetings_continue_as_guest.dart';
import 'package:movie_spot/ui/screens/login/greetings/widgets/greetings_image.dart';
import 'package:movie_spot/ui/screens/login/greetings/widgets/greetings_login_button.dart';
import 'package:movie_spot/ui/screens/login/greetings/widgets/greetings_register_button.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

import '../../../../utils/constants/app_constants.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';

class GreetingsPage extends StatelessWidget {
  const GreetingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    return BlocListener<GreetingsBloc, GreetingsState>(
      listener: _onChanged,
      child: _pageContent(context, loginBloc),
    );
  }

  void _onChanged(BuildContext context, GreetingsState state) {}

  Widget _pageContent(BuildContext context, LoginBloc bloc) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      child: Column(
        children: [
          const GreetingsImage(),
          _buttons(bloc),
          GreetingsContinueAsGuest(onPressed: _navigateToHome(context))
        ],
      ),
    );
  }

  Widget _buttons(LoginBloc bloc) {
    return Column(
      children: [
        _loginButton(bloc),
        const SizedBox(height: AppSizes.lg),
        _registerButton(bloc),
        const SizedBox(height: 80.0),
      ],
    );
  }

  void Function() _navigateToHome(BuildContext context) => () {
        context.navigate(HomeRouter.page);
      };

  GreetingsLoginButton _loginButton(LoginBloc bloc) {
    const loginIndex = AppConstants.signInPageIndex;
    return GreetingsLoginButton(onPressed: _navigateTo(loginIndex, bloc));
  }

  GreetingsRegisterButton _registerButton(LoginBloc bloc) {
    const registerIndex = AppConstants.signUpPageIndex;
    return GreetingsRegisterButton(onPressed: _navigateTo(registerIndex, bloc));
  }

  void Function() _navigateTo(int pageIndex, LoginBloc bloc) => () {
        bloc.add(LoginChangePageEvent(newIndex: pageIndex));
      };
}
