import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/app/providers/localization_provider.dart';
import 'package:movie_spot/localization/localization_extensions.dart';
import 'package:movie_spot/screens/splash/bloc/splash_state.dart';

import 'bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {});
    return BlocListener<SplashBloc, SplashState>(
      listener: _onPageChanged,
      child: Scaffold(body: _appLogo(context)),
    );
  }

  void _onPageChanged(BuildContext context, SplashState state) {
    if (state.listener == SplashListener.toLogin) {
      final locale = View.of(context).platformDispatcher.locale;

      context.setLocale(locale);

      Navigator.of(context).pushNamedAndRemoveUntil(
        '/login',
        (Route<dynamic> route) => false,
      );
    }
  }

  Widget _appLogo(BuildContext context) => Center(
        child: Text(
          context.appLocalizations.appName,
          textAlign: TextAlign.center,
          style: (const TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600)),
        ),
      );
}
