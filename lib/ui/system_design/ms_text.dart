import 'package:flutter/material.dart';
import 'package:movie_spot/app/providers/theme_provider.dart';

enum TextType {
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

class MsText extends StatelessWidget {
  const MsText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.fontLightColor,
    this.fontDarkColor,
    this.maxLines,
    this.textOverflow,
    this.textType,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;

  final Color? fontLightColor;
  final Color? fontDarkColor;

  final TextType? textType;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode();
    final textStyle = _textStyle(context);

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      style: textStyle?.copyWith(
        fontSize: fontSize,
        color: _fontColor(isDarkMode),
        fontWeight: fontWeight,
      ),
    );
  }

  TextStyle? _textStyle(BuildContext context) {
    if (textType == null) return Theme.of(context).textTheme.bodyMedium;
    return textType!.getTextStyle(context);
  }

  Color? _fontColor(bool isDarkMode) {
    if (isDarkMode && fontDarkColor != null) return fontDarkColor!;
    if (!isDarkMode && fontLightColor != null) return fontLightColor!;
    return null;
  }
}

extension MsTextExtensions on TextType {
  TextStyle? getTextStyle(BuildContext context) {
    final style = Theme.of(context).textTheme;

    switch (this) {
      case TextType.headlineLarge:
        return style.headlineLarge;
      case TextType.headlineMedium:
        return style.headlineMedium;
      case TextType.headlineSmall:
        return style.headlineSmall;
      case TextType.titleLarge:
        return style.titleLarge;
      case TextType.titleMedium:
        return style.titleMedium;
      case TextType.titleSmall:
        return style.titleSmall;
      case TextType.bodyLarge:
        return style.bodyLarge;
      case TextType.bodyMedium:
        return style.bodyMedium;
      case TextType.bodySmall:
        return style.bodySmall;
      case TextType.labelLarge:
        return style.labelLarge;
      case TextType.labelMedium:
        return style.labelMedium;
      case TextType.labelSmall:
        return style.labelSmall;
    }
  }
}
