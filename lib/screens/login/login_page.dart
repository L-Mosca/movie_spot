import 'package:flutter/material.dart';
import 'package:movie_spot/localization/localization_extensions.dart';
import 'package:movie_spot/router/app_router.dart';
import 'package:movie_spot/router/routes/home_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.navigate(HomeRouter.page);
                },
                child: Text(context.appLocalizations.appName))
          ],
        ),
      ),
    );
  }
}
