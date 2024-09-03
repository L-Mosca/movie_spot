import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:movie_spot/app/providers/theme_provider.dart';
import 'package:movie_spot/ui/system_design/ms_text.dart';
import 'package:movie_spot/utils/constants/app_colors.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class HomeMovieRating extends StatelessWidget {
  const HomeMovieRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [_ratingNumber(), _ratingStars(context)]);
  }

  Widget _ratingNumber() {
    return const MsText(
      text: "9.1  ",
      fontSize: 30,
      fontWeight: FontWeight.w500,
      fontLightColor: AppColors.ratingLightColor,
      fontDarkColor: AppColors.ratingDarkColor,
    );
  }

  Widget _ratingStars(BuildContext context) {
    bool isDark = context.actualIsDarkMode();

    Color starColor =
        isDark ? AppColors.ratingDarkColor : AppColors.ratingLightColor;

    Color emptyColor = isDark ? AppColors.darkerGrey : AppColors.grey;

    return PannableRatingBar.builder(
      rate: 3 / 2,
      alignment: WrapAlignment.center,
      spacing: AppSizes.xs,
      runSpacing: 10,
      itemCount: 5,
      direction: Axis.horizontal,
      itemBuilder: (context, index) {
        return RatingWidget(
          selectedColor: starColor,
          unSelectedColor: emptyColor,
          child: const Icon(Icons.star, size: 24),
        );
      },
    );
  }
}
