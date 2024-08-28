import 'package:flutter/material.dart';
import 'package:movie_spot/localization/localization_extensions.dart';
import 'package:movie_spot/ui/system_design/ms_elevated_button.dart';

class GreetingsRegisterButton extends StatelessWidget {
  const GreetingsRegisterButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MsElevatedButton(
      onPressed: onPressed,
      background: Colors.transparent,
      fontColor: Colors.blue.shade800,
      text: context.appLocalizations.signUp,
    );
  }
}
