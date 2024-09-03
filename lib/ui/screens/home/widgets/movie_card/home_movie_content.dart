import 'package:flutter/material.dart';
import 'package:movie_spot/ui/screens/home/widgets/movie_card/home_movie_director.dart';
import 'package:movie_spot/ui/screens/home/widgets/movie_card/home_movie_duration.dart';
import 'package:movie_spot/ui/screens/home/widgets/movie_card/home_movie_title.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

import 'home_movie_rating.dart';

class HomeMovieContent extends StatelessWidget {
  const HomeMovieContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeMovieTitle(),
          SizedBox(height: AppSizes.md),
          HomeMovieDirector(),
          HomeMovieDuration(),
          SizedBox(height: AppSizes.md),
          HomeMovieRating(),
        ],
      ),
    );
  }
}
