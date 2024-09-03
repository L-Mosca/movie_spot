import 'package:flutter/material.dart';
import 'package:movie_spot/ui/system_design/ms_text.dart';
import 'package:movie_spot/utils/constants/app_colors.dart';

class HomeMovieRating extends StatelessWidget {
  const HomeMovieRating({super.key});

  @override
  Widget build(BuildContext context) {
    return const MsText(
      text: "9.1  x.x.x.x.x",
      fontSize: 30,
      fontWeight: FontWeight.w500,
      fontLightColor: AppColors.ratingLightColor,
      fontDarkColor: AppColors.ratingDarkColor,
    );
  }
}
