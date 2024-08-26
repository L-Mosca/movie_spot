import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/router/app_router.dart';
import 'package:movie_spot/screens/splash/bloc/splash_state.dart';
import 'package:movie_spot/utils/constants/colors.dart';

import '../../router/routes/login_router.dart';
import 'bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: _onPageChanged,
      child: Scaffold(body: Container(color: AppColors.warning)),
    );
  }

  void _onPageChanged(BuildContext context, SplashState state) {
    if (state.listener == SplashListener.toLogin) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/login',
        (Route<dynamic> route) => false,
      );
    }
  }
}
