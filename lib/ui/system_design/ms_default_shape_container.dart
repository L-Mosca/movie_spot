import 'package:flutter/material.dart';
import 'package:movie_spot/app/providers/theme_provider.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

import '../../utils/constants/app_colors.dart';

class MsDefaultShapeContainer extends StatelessWidget {
  const MsDefaultShapeContainer({
    super.key,
    required this.child,
    this.containerLightColor,
    this.containerDarkColor,
    this.borderLightColor,
    this.borderDarkColor,
    this.borderRadius,
    this.internalPadding,
    this.borderWidth,
  });

  final Widget child;

  final Color? containerLightColor;
  final Color? containerDarkColor;

  final Color? borderLightColor;
  final Color? borderDarkColor;
  final double? borderRadius;

  final EdgeInsets? internalPadding;

  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode();
    return Container(
      decoration: BoxDecoration(
        color: _containerColor(isDark),
        borderRadius: _borderRadius,
        border: _border(isDark),
      ),
      child: Padding(padding: _padding, child: child),
    );
  }

  EdgeInsets get _padding =>
      internalPadding ??
      const EdgeInsets.symmetric(
        horizontal: AppSizes.lg,
        vertical: AppSizes.sm,
      );

  BorderRadius get _borderRadius => BorderRadius.circular(
        borderRadius ?? AppSizes.borderRadiusLg,
      );

  BoxBorder _border(bool isDark) {
    return Border.all(color: _borderColor(isDark), width: borderWidth ?? 2);
  }

  Color _containerColor(bool isDark) {
    if (isDark && containerDarkColor != null) return containerDarkColor!;
    if (!isDark && containerLightColor != null) return containerLightColor!;
    return isDark ? AppColors.darkContainer : AppColors.lightContainer;
  }

  Color _borderColor(bool isDark) {
    if (isDark && borderDarkColor != null) return borderDarkColor!;
    if (!isDark && borderLightColor != null) return borderLightColor!;
    return (isDark) ? AppColors.darkGrey.withOpacity(0.4) : AppColors.grey;
  }
}
