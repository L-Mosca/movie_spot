import 'package:flutter/material.dart';
import 'package:movie_spot/utils/constants/enums.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

/// Default elevated button widget. Itá wrapped by a constrained box, and it's widget limited elevated button width.
///
/// [onPressed] - Button onPressed callback
///
/// [padding] - Button internal padding
///
/// [width] - Button width
///
/// [height] - Button height
///
/// [buttonMaxWidth] - Enum that's define button max width
///
/// [borderRadius] - Button border radius
///
/// [background] - Button background color
///
/// [borderColor] - Button border color
///
/// [text] - Button center text
///
/// [fontSize] - Button text size
///
/// [fontColor] - Button text color
///
/// [fontWeight] - Button text weight
class MsElevatedButton extends StatelessWidget {
  const MsElevatedButton({
    super.key,
    // Button general setup and design
    required this.onPressed,
    this.padding,
    this.width,
    this.height,
    this.buttonMaxWidth,
    this.borderRadius,
    this.background,
    this.borderColor,

    // Elevated Button text setup
    required this.text,
    this.fontSize,
    this.fontColor,
    this.fontWeight,
  });

  // Button general setup and design
  final void Function() onPressed;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final ButtonMaxWidth? buttonMaxWidth;
  final double? borderRadius;
  final Color? background;
  final Color? borderColor;

  // Elevated Button text setup
  final String text;
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
