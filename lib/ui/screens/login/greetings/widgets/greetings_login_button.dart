import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_spot/localization/localization_extensions.dart';
import 'package:movie_spot/ui/screens/login/bloc/login_event.dart';
import 'package:movie_spot/ui/system_design/ms_elevated_button.dart';
import 'package:movie_spot/utils/constants/app_constants.dart';
import 'package:movie_spot/utils/constants/colors.dart';

class GreetingsLoginButton extends StatelessWidget {
  const GreetingsLoginButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MsElevatedButton(
      onPressed: onPressed,
      fontColor: AppColors.textWhite,
      text: context.appLocalizations.signIn,
    );
  }
}
