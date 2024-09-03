import 'package:flutter/material.dart';
import 'package:movie_spot/ui/system_design/ms_text.dart';

class HomeMovieTitle extends StatelessWidget {
  const HomeMovieTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const MsText(
      text: "Shrek",
      textType: TextType.titleLarge,
      fontSize: 28,
    );
  }
}
