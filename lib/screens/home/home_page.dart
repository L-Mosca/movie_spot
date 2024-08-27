import 'package:flutter/material.dart';
import 'package:movie_spot/app/providers/theme_provider.dart';
import 'package:movie_spot/localization/localization_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                final theme = (context.getThemeMode()) == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;

                context.setThemeMode(theme);
              },
              child: Text(context.appLocalizations.appName),
            ),
          ),
          Text(context.appLocalizations.appName),
        ],
      ),
    );
  }
}
