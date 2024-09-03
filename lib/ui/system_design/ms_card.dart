import 'package:flutter/material.dart';
import 'package:movie_spot/app/providers/theme_provider.dart';
import 'package:movie_spot/utils/constants/app_colors.dart';

import '../../utils/constants/sizes.dart';

/// Base Card widget. It's container inside a card widget.
/// Container defines dimensions, margins and padding.
/// Card defines elevation, background color and shadow color
///
/// [child] - Widget inside container
///
/// [width] - Container width
///
/// [height] - Container height
///
/// [elevation] - Card elevation
///
/// [borderRadius] - Card border radius
///
/// [margin] - Container margin
///
/// [padding] - Container padding
///
/// [cardLightColor] - Card light background color
///
/// [cardDarkColor] - Card dark background color
///
/// [shadowLightColor] - Card light shadow color
///
/// [shadowDarkColor] - Card dark shadow color
class MsCard extends StatelessWidget {
  const MsCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.elevation,
    this.borderRadius,
    this.margin,
    this.padding,
    this.cardLightColor,
    this.cardDarkColor,
    this.shadowLightColor,
    this.shadowDarkColor,
  });

  final Widget child;
  final double? width;
  final double? height;
  final double? elevation;
  final double? borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? cardLightColor;
  final Color? cardDarkColor;
  final Color? shadowLightColor;
  final Color? shadowDarkColor;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.actualIsDarkMode();

    final shadowColor = isDarkMode
        ? shadowDarkColor ?? AppColors.cardShadowDark
        : shadowLightColor ?? AppColors.cardShadowLight;
    final cardColor = isDarkMode
        ? cardDarkColor ?? AppColors.cardDark
        : cardLightColor ?? AppColors.cardLight;

    return Card(
      elevation: elevation ?? AppSizes.cardElevation,
      margin: margin,
      color: cardColor,
      shadowColor: shadowColor,
      shape: _borderShape,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }

  ShapeBorder get _borderShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppSizes.cardRadiusMd,
        ),
      );
}
