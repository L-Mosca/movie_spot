import 'package:flutter/material.dart';
import 'package:movie_spot/localization/localization_extensions.dart';
import 'package:movie_spot/ui/system_design/ms_elevated_button.dart';
import 'package:movie_spot/utils/constants/app_colors.dart';

class SignInLoginButton extends StatelessWidget {
  const SignInLoginButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MsElevatedButton(
      onPressed: onPressed,
      text: context.appLocalizations.signIn,
      fontColor: AppColors.white,
    );
  }
}