import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/ui/screens/login/greetings/bloc/greetings_bloc.dart';
import 'package:movie_spot/ui/screens/login/greetings/bloc/greetings_event.dart';
import 'package:movie_spot/ui/screens/login/greetings/bloc/greetings_state.dart';
import 'package:movie_spot/ui/screens/login/greetings/widgets/greetings_image.dart';
import 'package:movie_spot/ui/screens/login/greetings/widgets/greetings_login_button.dart';
import 'package:movie_spot/ui/screens/login/greetings/widgets/greetings_register_button.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class GreetingsPage extends StatelessWidget {
  const GreetingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GreetingsBloc, GreetingsState>(
      listener: _onChanged,
      child: _pageContent(context),
    );
  }

  void _onChanged(BuildContext context, GreetingsState state) {
    if (state.listener == GreetingsListener.signIn) {
      context.read<GreetingsBloc>().add(GreetingsResetListener());
    }

    if (state.listener == GreetingsListener.signUp) {
      context.read<GreetingsBloc>().add(GreetingsResetListener());
    }
  }

  Widget _pageContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      child: Column(children: [const GreetingsImage(), _buttons(context)]),
    );
  }

  Widget _buttons(BuildContext context) {
    return const Column(
      children: [
        GreetingsLoginButton(),
        SizedBox(height: AppSizes.lg),
        GreetingsRegisterButton(),
        SizedBox(height: 80.0),
      ],
    );
  }
}
