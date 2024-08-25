import 'package:flutter/widgets.dart';

/// Use to manage main app widget state
/// At this moment, this widget notify localization changes to switch supported strings
class LocalizationStateProvider extends InheritedWidget {
  final Locale locale;
  final Function(Locale) setLocale;

  const LocalizationStateProvider({
    super.key,
    required super.child,
    required this.locale,
    required this.setLocale,
  });

  static LocalizationStateProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LocalizationStateProvider>()!;
  }

  @override
  bool updateShouldNotify(LocalizationStateProvider oldWidget) {
    return locale != oldWidget.locale;
  }
}

/// Run time locale extensions
/// -> getLocale => Current app locale;
/// -> setLocale => Change locale and switch supported string resources
extension StateProviderExtensions on BuildContext {
  Locale getLocale() {
    return LocalizationStateProvider.of(this).locale;
  }

  void setLocale(Locale locale) {
    LocalizationStateProvider.of(this).setLocale(locale);
  }
}
