import 'package:flutter/material.dart';
import 'package:movie_spot/localization/localization_extensions.dart';
import 'package:movie_spot/ui/system_design/ms_text.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: AppSizes.xl),
      child: MsText(
        text: context.appLocalizations.registerHello,
        fontSize: 32.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
