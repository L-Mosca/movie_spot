import 'package:flutter/material.dart';
import 'package:movie_spot/app/providers/theme_provider.dart';

/// Base loading widget. It's wrapped by a sized box to change widget size.
///
/// [width] - Custom loading width.
///
/// [height] - Custom loading height.
///
/// [colorLight] - Custom circular light color.
///
/// [colorDark] - Custom circular dark color.
class MsLoading extends StatelessWidget {
  const MsLoading({
    super.key,
    this.width,
    this.height,
    this.colorLight,
    this.colorDark,
  });

  final double? width;
  final double? height;

  final Color? colorLight;
  final Color? colorDark;

  @override
  Widget build(BuildContext context) {
    final isDark = context.actualIsDarkMode();
    final color = isDark ? colorDark : colorLight;

    return SizedBox(
      width: width,
      height: height,
      child: CircularProgressIndicator(color: color),
    );
  }
}
