import 'package:flutter/material.dart';
import 'package:movie_spot/ui/screens/home/widgets/movie_card/home_movie_content.dart';
import 'package:movie_spot/ui/screens/home/widgets/movie_card/home_movie_image.dart';
import 'package:movie_spot/ui/system_design/ms_card.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class HomeMovieCard extends StatelessWidget {
  const HomeMovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MsCard(
      padding: EdgeInsets.all(AppSizes.md),
      margin: EdgeInsets.symmetric(horizontal: AppSizes.md),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          HomeMovieImage(),
          SizedBox(width: AppSizes.xl),
          HomeMovieContent(),
        ],
      ),
    );
  }
}
