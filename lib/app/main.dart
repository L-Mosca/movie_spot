import 'package:flutter/material.dart';
import 'package:movie_spot/di/dependency_injection.dart';

import 'app.dart';

void main() {
  DependencyInjection.init();
  runApp(const App());
}