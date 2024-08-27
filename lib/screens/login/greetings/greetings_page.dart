import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/screens/login/greetings/bloc/greetings_bloc.dart';
import 'package:movie_spot/screens/login/greetings/bloc/greetings_event.dart';
import 'package:movie_spot/screens/login/greetings/bloc/greetings_state.dart';

class GreetingsPage extends StatelessWidget {
  const GreetingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GreetingsBloc, GreetingsState>(
      listener: _onChanged,
      child: Scaffold(body: Container(color: Colors.red)),
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
}
