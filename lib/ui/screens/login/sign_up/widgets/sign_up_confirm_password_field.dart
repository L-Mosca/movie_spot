import 'package:flutter/material.dart';
import 'package:movie_spot/localization/localization_extensions.dart';
import 'package:movie_spot/ui/system_design/ms_text_field.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class SignUpConfirmPasswordField extends StatelessWidget {
  const SignUpConfirmPasswordField({super.key, required this.onTextChanged});

  final ValueChanged<String> onTextChanged;

  @override
  Widget build(BuildContext context) {
    return MsTextField(
      onTextChanged: onTextChanged,
      hintText: context.appLocalizations.confirmPassword,
      fontSize: AppSizes.fontSizeMd,
      fontWeight: FontWeight.w600,
      passwordField: true,
    );
  }
}
