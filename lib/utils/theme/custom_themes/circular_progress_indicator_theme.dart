import 'package:flutter/material.dart';
import 'package:movie_spot/utils/constants/app_colors.dart';

/// -- Light & Dark circular progress indicator Themes
class MCircularProgressIndicatorTheme {
  MCircularProgressIndicatorTheme._();

  /// Customizable Light Circular Progress Indicator Theme
  static ProgressIndicatorThemeData lightProgressIndicatorTheme =
      const ProgressIndicatorThemeData(
    color: AppColors.primary,
  );

  /// Customizable Dark Circular Progress Indicator Theme
  static ProgressIndicatorThemeData darkProgressIndicatorTheme =
  const ProgressIndicatorThemeData(
    color: AppColors.primary,
  );
}
