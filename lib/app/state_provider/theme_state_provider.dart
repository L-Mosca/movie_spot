import 'package:flutter/material.dart';

class ThemeStateProvider extends InheritedWidget {
  final ThemeMode? themeMode;
  final Function(ThemeMode) setThemeMode;

  const ThemeStateProvider({
    super.key,
    required super.child,
    required this.themeMode,
    required this.setThemeMode,
  });

  static ThemeStateProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeStateProvider>()!;
  }

  @override
  bool updateShouldNotify(ThemeStateProvider oldWidget) {
    if (themeMode == null) return false;
    return themeMode != oldWidget.themeMode;
  }
}

/// Runtime theme mode extensions
/// -> getThemeMode => Current app theme mode;
/// -> setThemeMode => Change theme mode and switch between dark and light themes
extension ThemeProviderExtensions on BuildContext {
  ThemeMode getThemeMode() {
    final theme = ThemeStateProvider.of(this).themeMode;
    if (theme == null) {
      return (MediaQuery.of(this).platformBrightness == Brightness.dark)
          ? ThemeMode.dark
          : ThemeMode.light;
    }
    return theme;
  }

  void setThemeMode(ThemeMode themeMode) {
    ThemeStateProvider.of(this).setThemeMode(themeMode);
  }
}
