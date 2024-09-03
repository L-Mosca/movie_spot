import 'package:flutter/material.dart';
import 'package:movie_spot/localization/localization_extensions.dart';
import 'package:movie_spot/ui/system_design/ms_text.dart';
import 'package:movie_spot/utils/constants/app_colors.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class HomeMovieDuration extends StatelessWidget {
  const HomeMovieDuration({super.key});

  @override
  Widget build(BuildContext context) {
    return MsText(
      text: "${context.appLocalizations.duration} 100min",
      fontDarkColor: AppColors.textDark,
      fontWeight: FontWeight.w400,
      fontSize: AppSizes.fontSizeSm,
    );
  }
}
