import 'package:flutter/material.dart';
import 'package:movie_spot/localization/localization_extensions.dart';

import '../../app/state_provider/app_state_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final locale = context.getLocale() == const Locale("pt", "BR")
                ? const Locale('en', 'US')
                : const Locale('pt', 'BR');
            context.setLocale(locale);
          },
          child: Text(context.appLocalizations.test),
        ),
      ),
    );
  }
}
