import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/ui/screens/login/bloc/login_bloc.dart';
import 'package:movie_spot/ui/screens/login/bloc/login_event.dart';
import 'package:movie_spot/ui/screens/login/sign_up/bloc/sign_up_bloc.dart';
import 'package:movie_spot/ui/screens/login/sign_up/bloc/sign_up_event.dart';
import 'package:movie_spot/ui/screens/login/sign_up/bloc/sign_up_state.dart';
import 'package:movie_spot/ui/screens/login/sign_up/widgets/sign_up_back_button.dart';
import 'package:movie_spot/ui/screens/login/sign_up/widgets/sign_up_confirm_password_field.dart';
import 'package:movie_spot/ui/screens/login/sign_up/widgets/sign_up_email_field.dart';
import 'package:movie_spot/ui/screens/login/sign_up/widgets/sign_up_have_account.dart';
import 'package:movie_spot/ui/screens/login/sign_up/widgets/sign_up_password_field.dart';
import 'package:movie_spot/ui/screens/login/sign_up/widgets/sign_up_register_button.dart';
import 'package:movie_spot/ui/screens/login/sign_up/widgets/sign_up_title.dart';
import 'package:movie_spot/ui/screens/login/sign_up/widgets/sign_up_username_field.dart';
import 'package:movie_spot/utils/constants/sizes.dart';
import 'package:movie_spot/utils/device/device_utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _username = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    return BlocListener<SignUpBloc, SignUpState>(
      listener: _onChanged,
      child: _pageContent(loginBloc),
    );
  }

  void _onChanged(BuildContext context, SignUpState state) {}

  Widget _pageContent(LoginBloc bloc) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return GestureDetector(
        onTap: _hideKeyboard(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
          child: Column(
            children: [
              _registerForm(bloc),
              SignUpHaveAccount(onPressed: _back(bloc, context))
            ],
          ),
        ),
      );
    });
  }

  Widget _registerForm(LoginBloc bloc) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SignUpBackButton(onPressed: _back(bloc, context)),
            const SignUpTitle(),
            const SizedBox(height: 100.0),
            SignUpUsernameField(onTextChanged: _updateUsernameValue),
            const SizedBox(height: 16.0),
            SignUpEmailField(onTextChanged: _updateEmailValue),
            const SizedBox(height: 16.0),
            SignUpPasswordField(onTextChanged: _updatePasswordValue),
            const SizedBox(height: 16.0),
            SignUpConfirmPasswordField(
                onTextChanged: _updateConfirmPasswordValue),
            const SizedBox(height: AppSizes.xl),
            SignUpRegisterButton(onPressed: _register()),
            const SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }

  void Function() _register() => () {
        _hideKeyboard();
        context.read<SignUpBloc>().add(
              SignUpRegisterEvent(
                username: _username,
                email: _email,
                password: _password,
                confirmPassword: _confirmPassword,
              ),
            );
      };

  void _updateUsernameValue(String newValue) {
    setState(() => _username = newValue);
  }

  void _updateEmailValue(String newValue) {
    setState(() => _email = newValue);
  }

  void _updatePasswordValue(String newValue) {
    setState(() => _password = newValue);
  }

  void _updateConfirmPasswordValue(String newValue) {
    setState(() => _confirmPassword = newValue);
  }

  void Function() _hideKeyboard() => () {
        DeviceUtils.hideKeyboard(context);
      };

  void Function() _back(LoginBloc bloc, BuildContext context) => () {
        bloc.add(LoginBackPageEvent());
      };
}
