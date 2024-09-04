import 'package:flutter/material.dart';
import 'package:movie_spot/ui/screens/home/widgets/movie_card/home_movie_card.dart';
import 'package:movie_spot/utils/constants/sizes.dart';

class HomeMovieList extends StatelessWidget {
  const HomeMovieList({super.key, required this.movieList});

  final List<String>? movieList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: movieList?.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            if (index == 0) const SizedBox(height: AppSizes.xl),
            const HomeMovieCard(),
            const SizedBox(height: AppSizes.lg)
          ],
        );
      },
    );
  }
}
