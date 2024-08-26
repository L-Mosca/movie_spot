import 'package:flutter/material.dart';
import 'package:movie_spot/router/routes/login_router.dart';
import 'package:movie_spot/router/routes/splash_router.dart';
import 'package:movie_spot/utils/constants/enums.dart';

import 'routes/home_router.dart';

class AppRouter {
  Map<String, WidgetBuilder> get routes {
    return {
      "/": (context) => SplashRouter.page,
      "/login": (context) => LoginRouter.page,
      "/home": (context) => HomeRouter.page,
    };
  }
}

PageRouteBuilder _createPageRoute(
  Widget page, {
  RouteAnimation? customAnimation,
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween =
          Tween<Offset>(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}

extension RouterExtensions on BuildContext {
  void navigate(Widget page) {
    Navigator.of(this).push(_createPageRoute(page));
  }
}
