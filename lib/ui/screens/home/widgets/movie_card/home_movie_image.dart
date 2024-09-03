import 'package:flutter/material.dart';
import 'package:movie_spot/ui/system_design/ms_card.dart';
import 'package:movie_spot/utils/constants/image_strings.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class HomeMovieImage extends StatelessWidget {
  const HomeMovieImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: MsCard(
        width: 140,
        height: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusMd),
          child: Image.asset(
            AppImages.imgMovieTest,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
