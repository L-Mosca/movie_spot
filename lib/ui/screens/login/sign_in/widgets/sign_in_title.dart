import 'package:flutter/material.dart';
import 'package:movie_spot/localization/localization_extensions.dart';
import 'package:movie_spot/ui/system_design/ms_text.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class SignInTitle extends StatelessWidget {
  const SignInTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: AppSizes.xl),
      child: MsText(
        text: context.appLocalizations.welcomeBack,
        fontSize: 32.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
