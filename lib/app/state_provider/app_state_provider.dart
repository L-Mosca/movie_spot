import 'package:flutter/widgets.dart';

/// Use to manage main app widget state
/// At this moment, this widget notify localization changes to switch supported strings
class AppStateProvider extends InheritedWidget {
  final Locale locale;
  final Function(Locale) setLocale;

  const AppStateProvider({
    super.key,
    required super.child,
    required this.locale,
    required this.setLocale,
  });

  static AppStateProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateProvider>()!;
  }

  @override
  bool updateShouldNotify(AppStateProvider oldWidget) {
    return locale != oldWidget.locale;
  }
}

/// Run time locale extensions
/// -> getLocale => Current app locale;
/// -> setLocale => Change locale and switch supported string resources
extension StateProviderExtensions on BuildContext {
  Locale getLocale() {
    return AppStateProvider.of(this).locale;
  }

  void setLocale(Locale locale) {
    AppStateProvider.of(this).setLocale(locale);
  }
}
