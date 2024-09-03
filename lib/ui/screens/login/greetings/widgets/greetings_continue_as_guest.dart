import 'package:flutter/material.dart';
import 'package:movie_spot/localization/localization_extensions.dart';
import 'package:movie_spot/ui/system_design/ms_text.dart';
import 'package:movie_spot/utils/constants/app_colors.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class GreetingsContinueAsGuest extends StatelessWidget {
  const GreetingsContinueAsGuest({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
        child: MsText(
          text: context.appLocalizations.continueGuest,
          fontLightColor: AppColors.primary.withOpacity(0.9),
          fontDarkColor: AppColors.primary.withOpacity(0.8),
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.fontSizeMd,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
