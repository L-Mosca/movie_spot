import 'package:flutter/material.dart';

import 'home/home_router.dart';

class AppRouter {
  Map<String, WidgetBuilder> get routes {
    return {
      "/": (context) => HomeRouter.page,
    };
  }
}