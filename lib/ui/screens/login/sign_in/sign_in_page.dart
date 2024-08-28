import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/app/providers/theme_provider.dart';
import 'package:movie_spot/ui/screens/login/bloc/login_bloc.dart';
import 'package:movie_spot/ui/screens/login/sign_in/bloc/sign_in_bloc.dart';
import 'package:movie_spot/ui/screens/login/sign_in/widgets/sign_in_back_button.dart';
import 'package:movie_spot/ui/screens/login/sign_in/widgets/sign_in_title.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

import 'bloc/sign_in_state.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return BlocListener<SignInBloc, SignInState>(
      listener: _onChanged,
      child: _pageContent(loginBloc),
    );
  }

  void _onChanged(BuildContext context, SignInState state) {}

  Widget _pageContent(LoginBloc bloc) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
        child: Column(
          children: [
            SignInBackButton(onPressed: _back(bloc, context)),
            const Expanded(
              child: Column(
                children: [SignInTitle()],
              ),
            )
          ],
        ),
      );
    });
  }

  void Function() _back(LoginBloc bloc, BuildContext context) => () {
        context.switchThemeMode();
        //bloc.add(LoginBackPageEvent());
      };
}
