import 'package:flutter/material.dart';
import 'package:movie_spot/app/providers/theme_provider.dart';
import 'package:movie_spot/utils/constants/app_colors.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class MsBackButton extends StatelessWidget {
  const MsBackButton({
    super.key,
    this.icon,
    this.size,
    this.onPressed,
    this.iconColor,
    this.iconLightColor,
    this.iconDarkColor,
    this.borderColor,
    this.borderLightColor,
    this.borderDarkColor,
    this.containerColor,
    this.containerLightColor,
    this.containerDarkColor,
  });

  final IconData? icon;
  final double? size;
  final void Function()? onPressed;

  final Color? iconColor;
  final Color? iconLightColor;
  final Color? iconDarkColor;

  final Color? borderColor;
  final Color? borderLightColor;
  final Color? borderDarkColor;

  final Color? containerColor;
  final Color? containerLightColor;
  final Color? containerDarkColor;

  @override
  Widget build(BuildContext context) {
    final theme = context.getThemeMode();
    Color contentColor = _contentColor(context, theme);
    Color borderColor = _borderColor(context, theme);

    return GestureDetector(
      onTap: onPressed,
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: _decoration(contentColor, borderColor),
          child: Center(
            child: Icon(
              icon ?? Icons.arrow_back_ios_new,
              size: size ?? 26.0,
              color: contentColor,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _decoration(Color contentColor, Color borderColor) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
      border: Border.all(
        color: borderColor,
        width: AppSizes.strokeDefaultWidth,
      ),
    );
  }

  Color _contentColor(BuildContext context, ThemeMode theme) {
    if (iconColor != null) return iconColor!;

    if (theme == ThemeMode.dark && iconDarkColor != null) return iconDarkColor!;
    if (theme == ThemeMode.light && iconLightColor != null) {
      return iconLightColor!;
    }

    return (theme == ThemeMode.light) ? AppColors.dark : AppColors.grey;
  }

  Color _borderColor(BuildContext context, ThemeMode theme) {
    if (borderColor != null) return borderColor!;

    if (theme == ThemeMode.dark && borderDarkColor != null) {
      return borderDarkColor!;
    } else {
      if (borderLightColor != null) return borderLightColor!;
    }

    return (theme == ThemeMode.dark)
        ? AppColors.darkGrey.withOpacity(0.3)
        : AppColors.grey;
  }
}
