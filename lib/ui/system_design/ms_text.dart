import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MsText extends StatelessWidget {
  const MsText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
