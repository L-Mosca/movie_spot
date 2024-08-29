import 'package:flutter/material.dart';
import 'package:movie_spot/ui/system_design/ms_back_button.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class SignInBackButton extends StatelessWidget {
  const SignInBackButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: AppSizes.xl),
        child: MsBackButton(onPressed: onPressed),
      ),
    );
  }
}
