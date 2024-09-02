import 'package:flutter/material.dart';
import 'package:movie_spot/di/dependency_injection.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  runApp(const App());
}