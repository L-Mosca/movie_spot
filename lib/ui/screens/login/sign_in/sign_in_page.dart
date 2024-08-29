import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/ui/screens/login/bloc/login_bloc.dart';
import 'package:movie_spot/ui/screens/login/bloc/login_event.dart';
import 'package:movie_spot/ui/screens/login/sign_in/bloc/sign_in_bloc.dart';
import 'package:movie_spot/ui/screens/login/sign_in/widgets/sign_in_back_button.dart';
import 'package:movie_spot/ui/screens/login/sign_in/widgets/sign_in_dont_have_account.dart';
import 'package:movie_spot/ui/screens/login/sign_in/widgets/sign_in_email_field.dart';
import 'package:movie_spot/ui/screens/login/sign_in/widgets/sign_in_forgot_password.dart';
import 'package:movie_spot/ui/screens/login/sign_in/widgets/sign_in_login_button.dart';
import 'package:movie_spot/ui/screens/login/sign_in/widgets/sign_in_password_field.dart';
import 'package:movie_spot/ui/screens/login/sign_in/widgets/sign_in_title.dart';
import 'package:movie_spot/utils/constants/app_constants.dart';
import 'package:movie_spot/utils/constants/sizes.dart';
import 'package:movie_spot/utils/device/device_utils.dart';

import 'bloc/sign_in_event.dart';
import 'bloc/sign_in_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    return BlocListener<SignInBloc, SignInState>(
      listener: _onChanged,
      child: _pageContent(loginBloc),
    );
  }

  void _onChanged(BuildContext context, SignInState state) {}

  Widget _pageContent(LoginBloc bloc) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return GestureDetector(
        onTap: _hideKeyboard(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
          child: Column(
            children: [
              SignInBackButton(onPressed: _back(bloc, context)),
              _loginForm(bloc),
              SignInDontHaveAccount(onPressed: _navigateToSignUp(bloc))
            ],
          ),
        ),
      );
    });
  }

  Widget _loginForm(LoginBloc bloc) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SignInTitle(),
            const SizedBox(height: 100),
            SignInEmailField(onTextChanged: _updateEmailValue),
            const SizedBox(height: AppSizes.lg),
            SignInPasswordField(onTextChanged: _updatePasswordValue),
            const SizedBox(height: 12.0),
            SignInForgotPassword(onPressed: _navigateToSignUp(bloc)),
            const SizedBox(height: AppSizes.xl),
            SignInLoginButton(onPressed: _doLogin()),
          ],
        ),
      ),
    );
  }

  void _updateEmailValue(String newValue) {
    setState(() => _email = newValue);
  }

  void _updatePasswordValue(String newValue) {
    setState(() => _password = newValue);
  }

  void Function() _navigateToSignUp(LoginBloc bloc) => () {
        bloc.add(LoginChangePageEvent(newIndex: AppConstants.signUpPageIndex));
      };

  void Function() _doLogin() => () {
        _hideKeyboard();
        context
            .read<SignInBloc>()
            .add(SignInLoginEvent(email: _email, password: _password));
      };

  void Function() _back(LoginBloc bloc, BuildContext context) => () {
        bloc.add(LoginBackPageEvent());
      };

  void Function() _hideKeyboard() => () {
        DeviceUtils.hideKeyboard(context);
      };
}
