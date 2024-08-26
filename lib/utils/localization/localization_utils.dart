import 'package:flutter/cupertino.dart';

class LocalizationUtils {
  LocalizationUtils._();

  /// Handle supported locales by user device default config.
  /// If device locale == pt, BR => set as app locale
  /// Else => set en, US as app locale
  static Locale getSupportedLocale(Locale deviceLocale) {
    return deviceLocale == const Locale("pt", "BR")
        ? const Locale('pt', 'BR')
        : const Locale('en', 'US');
  }
}
