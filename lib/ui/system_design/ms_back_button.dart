import 'package:flutter/material.dart';
import 'package:movie_spot/app/providers/theme_provider.dart';
import 'package:movie_spot/utils/constants/app_colors.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

/// Back button default widget. It's a widget that's contains a back icon and is wrapped by a container with rounded border.
///
/// [icon] - Icon type
///
/// [size] - Icon size
///
/// [onPressed] - Callback when click
///
/// [iconLightColor] - Icon light color
///
/// [iconDarkColor] - Icon dark color
///
/// [borderLightColor] - Container border light color
///
/// [borderDarkColor] - Container border dark color
///
/// [containerLightColor] - Container background light color
///
/// [containerDarkColor] - Container background dark color
///
class MsBackButton extends StatelessWidget {
  const MsBackButton({
    super.key,
    // Icon design
    this.icon,
    this.size,
    this.onPressed,
    this.iconLightColor,
    this.iconDarkColor,

    // Container design
    this.borderLightColor,
    this.borderDarkColor,
    this.containerLightColor,
    this.containerDarkColor,
  });

  // Icon design
  final IconData? icon;
  final double? size;
  final void Function()? onPressed;
  final Color? iconLightColor;
  final Color? iconDarkColor;

  // Container design
  final Color? borderLightColor;
  final Color? borderDarkColor;
  final Color? containerLightColor;
  final Color? containerDarkColor;

  @override
  Widget build(BuildContext context) {
    final isDark = context.actualIsDarkMode();
    Color contentColor = _contentColor(isDark);
    Color borderColor = _borderColor(isDark);

    return GestureDetector(
      onTap: onPressed,
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.all(14.0),
          decoration: _decoration(contentColor, borderColor),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: Icon(
                    icon ?? Icons.arrow_back_ios_new,
                    size: size ?? 22.0,
                    color: contentColor,
                  ),
                ),
                const SizedBox(width: 2)
              ],
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
        width: 2,
      ),
    );
  }

  Color _contentColor(bool isDark) {
    if (isDark && iconDarkColor != null) return iconDarkColor!;
    if (!isDark && iconLightColor != null) return iconLightColor!;
    return (isDark) ?  AppColors.primary.withOpacity(0.9) : AppColors.dark;
  }

  Color _borderColor(bool isDark) {
    if (isDark && borderDarkColor != null) return borderDarkColor!;
    if (!isDark && borderLightColor != null) return borderLightColor!;
    return (isDark) ? AppColors.primary.withOpacity(0.4) : AppColors.grey;
  }
}
