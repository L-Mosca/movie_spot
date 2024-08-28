import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';

class GreetingsImage extends StatelessWidget {
  const GreetingsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Image.asset(
            AppImages.imgGreetings,
            width: 200.0,
            height: 200.0,
          ),
        ),
      ),
    );
  }
}
