import 'package:flutter/material.dart';
import 'package:movie_spot/localization/localization_extensions.dart';
import 'package:movie_spot/ui/system_design/ms_text.dart';
import 'package:movie_spot/utils/constants/app_colors.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class SignInDontHaveAccount extends StatelessWidget {
  const SignInDontHaveAccount({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: _margin,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _dontHaveAccount(context),
            _registerNow(context),
          ],
        ),
      ),
    );
  }

  EdgeInsets get _margin => const EdgeInsets.only(
        bottom: AppSizes.lg,
        right: AppSizes.sm,
        left: AppSizes.sm,
      );

  MsText _dontHaveAccount(BuildContext context) => MsText(
        text: context.appLocalizations.dontHasAccount,
        fontWeight: FontWeight.w500,
      );

  Widget _registerNow(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: MsText(
          text: "  ${context.appLocalizations.registerNow}",
          fontLightColor: AppColors.primary,
          fontDarkColor: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
      );
}
