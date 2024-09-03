import 'package:flutter/material.dart';
import 'package:movie_spot/app/providers/theme_provider.dart';
import 'package:movie_spot/localization/localization_extensions.dart';
import 'package:movie_spot/ui/screens/home/widgets/movie_card/home_movie_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HomeMovieCard(),
            const SizedBox(height: 20),
            const HomeMovieCard(),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                final theme = (context.getThemeMode()) == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;

                context.setThemeMode(theme);
              },
              child: Text(context.appLocalizations.appName),
            ),
          ],
        ),
      ),
    );
  }
}
