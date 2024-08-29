import 'package:flutter/material.dart';
import 'package:movie_spot/localization/localization_extensions.dart';
import 'package:movie_spot/ui/system_design/ms_text_field.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class SignInEmailField extends StatelessWidget {
  const SignInEmailField({super.key, required this.onTextChanged});

  final ValueChanged<String> onTextChanged;

  @override
  Widget build(BuildContext context) {
    return MsTextField(
      onTextChanged: onTextChanged,
      hintText: context.appLocalizations.insertEmail,
      fontSize: AppSizes.fontSizeMd,
      fontWeight: FontWeight.w600,
    );
  }
}
