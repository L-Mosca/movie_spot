import 'package:flutter/material.dart';
import 'package:movie_spot/app/providers/theme_provider.dart';
import 'package:movie_spot/localization/localization_extensions.dart';
import 'package:movie_spot/ui/system_design/ms_elevated_button.dart';
import 'package:movie_spot/utils/constants/colors.dart';

class GreetingsLoginButton extends StatelessWidget {
  const GreetingsLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MsElevatedButton(
      onPressed: () {
        final theme = context.getThemeMode() == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light;
        context.setThemeMode(theme);
      },
      fontColor: AppColors.textWhite,
      text: context.appLocalizations.signIn,
    );
  }
}
