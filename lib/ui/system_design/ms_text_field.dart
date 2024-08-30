import 'package:flutter/material.dart';
import 'package:movie_spot/app/providers/theme_provider.dart';
import 'package:movie_spot/ui/system_design/ms_default_shape_container.dart';
import 'package:movie_spot/utils/constants/app_colors.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

/// Base text field widget.
///
/// This widget it's wrapped by a MsDefaultShapeContainer.
/// This is a default container to mold widgets like a text field.
///
/// [onTextChanged] - Callback when change text field text
///
/// [maxLines] - Max lines
///
/// [maxLength] - Max text length
///
/// [keyboardType] - Text field keyboard type
///
/// [inputAction] - Keyboard action button
///
/// [onEditingComplete] - Callback when select keyboard action button
///
/// [passwordField] - Define if it's a password text field (show eye icon and switch font to '*')
///
/// [fontWeight] - Text field font weight
///
/// [fontLightColor] - Text field light font color
///
/// [fontDarkColor] - Text field dark font color
///
/// [fontSize] - Text field font size
///
/// [hintLightColor] - Text field hint light color
///
/// [hintDarkColor] - Text field hint dark color
///
/// [hintText] - Text field hint text
///
/// [borderLightColor] - Text field container border light color
///
/// [borderDarkColor] - Text field container border dark color
///
/// [backgroundLightColor] Text field container light color
///
/// [backgroundLightColor] Text field container dark color
///
/// [borderWidth] - Text field container border width
///
/// [borderRadius] - Text field container border radius
///
/// [internalPadding] - Text field container internal padding

class MsTextField extends StatefulWidget {
  const MsTextField({
    super.key,
    // General Text Field Setup
    this.onTextChanged,
    this.maxLines,
    this.maxLength,
    this.keyboardType,
    this.inputAction,
    this.onEditingComplete,
    this.passwordField,

    // Font and Hint Setup
    this.fontWeight,
    this.fontLightColor,
    this.fontDarkColor,
    this.fontSize,
    this.hintLightColor,
    this.hintDarkColor,
    required this.hintText,

    // Text Field Container Color
    this.borderLightColor,
    this.borderDarkColor,
    this.backgroundLightColor,
    this.backgroundDarkColor,
    this.borderWidth,
    this.borderRadius,
    this.internalPadding,
  });

  // General Text Field Setup
  final ValueChanged<String>? onTextChanged;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final VoidCallback? onEditingComplete;
  final bool? passwordField;

  // Font and Hint Setup
  final FontWeight? fontWeight;
  final Color? fontLightColor;
  final Color? fontDarkColor;
  final double? fontSize;
  final Color? hintLightColor;
  final Color? hintDarkColor;
  final String hintText;

  // Text Field Container Color
  final Color? borderLightColor;
  final Color? borderDarkColor;
  final Color? backgroundLightColor;
  final Color? backgroundDarkColor;
  final double? borderWidth;
  final double? borderRadius;
  final EdgeInsets? internalPadding;

  @override
  State<MsTextField> createState() => _MsTextFieldState();
}

class _MsTextFieldState extends State<MsTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _obscureText = true;
  late bool passwordField;

  @override
  void initState() {
    super.initState();
    passwordField = widget.passwordField ?? false;
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode();

    return MsDefaultShapeContainer(
      borderDarkColor: widget.borderDarkColor,
      borderLightColor: widget.borderLightColor,
      containerDarkColor: widget.backgroundDarkColor,
      containerLightColor: widget.backgroundLightColor,
      borderWidth: widget.borderWidth,
      borderRadius: widget.borderRadius,
      internalPadding: _padding,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              controller: _controller,
              style: _fontStyle,
              decoration: _hintStyle,
              onChanged: _onTextChanged,
              maxLines: widget.maxLines ?? 1,
              maxLength: widget.maxLength,
              keyboardType: _keyboardType,
              textInputAction: widget.inputAction ?? TextInputAction.next,
              obscureText: passwordField ? _obscureText : false,
            ),
          ),
          if (passwordField) _eyeIcon(isDark)
        ],
      ),
    );
  }

  TextInputType? get _keyboardType {
    if (passwordField) return TextInputType.visiblePassword;
    return widget.keyboardType;
  }

  EdgeInsets get _padding =>
      widget.internalPadding ??
      const EdgeInsets.only(
        top: AppSizes.sm,
        bottom: AppSizes.sm,
        left: AppSizes.md,
        right: AppSizes.xs,
      );

  Widget _eyeIcon(bool isDark) {
    return IconButton(
      onPressed: _switchObscure(),
      icon: Icon(
        _obscureText ? Icons.visibility : Icons.visibility_off,
        color: eyeColor(isDark),
      ),
    );
  }

  Color eyeColor(bool isDark) {
    return isDark
        ? AppColors.light.withOpacity(0.5)
        : AppColors.dark.withOpacity(0.5);
  }

  void Function() _switchObscure() => () {
        setState(() => _obscureText = !_obscureText);
      };

  TextStyle? get _fontStyle => Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: widget.fontWeight,
        color: _textColor(context.isDarkMode()),
        fontSize: widget.fontSize ?? 16.0,
      );

  InputDecoration get _hintStyle => InputDecoration(
        border: InputBorder.none,
        hintText: widget.hintText,
        labelStyle: _labelTextStyle,
        hintStyle: _labelTextStyle,
        counter: const Offstage(),
      );

  TextStyle? get _labelTextStyle =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: _hintColor(context.isDarkMode()),
            fontWeight: FontWeight.w400,
            fontSize: widget.fontSize ?? 16.0,
          );

  void _onTextChanged(String text) {
    setState(() {
      _controller.text = text;
      if (widget.onTextChanged != null) widget.onTextChanged!(text);
    });
  }

  Color? _textColor(bool isDark) {
    if (isDark && widget.fontDarkColor != null) return widget.fontDarkColor;
    if (!isDark && widget.fontLightColor != null) return widget.fontLightColor;
    return isDark ? AppColors.light : AppColors.dark;
  }

  Color? _hintColor(bool isDark) {
    if (isDark && widget.hintDarkColor != null) return widget.hintDarkColor;
    if (!isDark && widget.hintLightColor != null) return widget.hintLightColor;
    return isDark
        ? AppColors.light.withOpacity(0.6)
        : AppColors.dark.withOpacity(0.6);
  }
}
