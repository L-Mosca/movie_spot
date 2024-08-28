import 'package:flutter/material.dart';
import 'package:movie_spot/utils/constants/enums.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class MsElevatedButton extends StatelessWidget {
  const MsElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.padding,
    this.width,
    this.height,
    this.buttonMaxWidth,
    this.borderRadius,
    this.background,
    this.borderColor,
    this.fontSize,
    this.fontColor,
    this.fontWeight,
  });

  final String text;
  final void Function() onPressed;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final ButtonMaxWidth? buttonMaxWidth;

  final double? borderRadius;
  final Color? background;
  final Color? borderColor;

  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: _maxWidth),
      child: SizedBox(
        width: width ?? double.infinity,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: _style(context),
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Text(text, style: textStyle?.copyWith(color: fontColor)),
          ),
        ),
      ),
    );
  }

  double get _maxWidth {
    if (buttonMaxWidth == null) return AppSizes.buttonWidthLg;

    switch (buttonMaxWidth) {
      case ButtonMaxWidth.small:
        return AppSizes.buttonWidthSm;
      case ButtonMaxWidth.medium:
        return AppSizes.buttonWidthMd;
      case ButtonMaxWidth.large:
        return AppSizes.buttonWidthLg;
      default:
        return AppSizes.buttonWidthMd;
    }
  }

  ButtonStyle _style(BuildContext context) {
    final defaultTheme = Theme.of(context).elevatedButtonTheme.style;

    return ElevatedButton.styleFrom(
      backgroundColor: _background(defaultTheme),
      shape: _border,
      textStyle: _textStyle(defaultTheme),
      side: _side(defaultTheme),
    );
  }

  Color? _background(ButtonStyle? defaultTheme) =>
      background ?? defaultTheme?.backgroundColor?.resolve({});

  OutlinedBorder get _border => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppSizes.buttonRadius,
        ),
      );

  TextStyle? _textStyle(ButtonStyle? defaultTheme) {
    final defaultStyle = defaultTheme?.textStyle?.resolve({});
    if (defaultTheme?.textStyle?.resolve({}) == null) return null;

    final size = fontSize ?? defaultStyle?.fontSize ?? AppSizes.fontSizeMd;
    final color = fontColor ?? defaultStyle?.color;
    final weight = fontWeight ?? defaultStyle?.fontWeight ?? FontWeight.w600;

    return TextStyle(fontSize: size, color: color, fontWeight: weight);
  }

  BorderSide? _side(ButtonStyle? defaultTheme) {
    return borderColor == null
        ? defaultTheme?.side?.resolve({})
        : BorderSide(color: borderColor!);
  }
}
