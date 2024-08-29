import 'package:flutter/material.dart';
import 'package:movie_spot/localization/localization_extensions.dart';
import 'package:movie_spot/ui/system_design/ms_text.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class SignInForgotPassword extends StatelessWidget {
  const SignInForgotPassword({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: double.infinity,
        child: MsText(
          text: context.appLocalizations.forgotPassword,
          fontSize: AppSizes.fontSizeSm,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
