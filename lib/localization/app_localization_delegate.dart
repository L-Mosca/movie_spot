import 'package:flutter/widgets.dart';
import 'package:movie_spot/localization/app_localizations.dart';

import 'en_us/en_us.dart';
import 'pt_br/pt_br.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  final PtBr ptBrLocalization;
  final EnUs enUsLocalization;

  Locale? _lastLocale;

  AppLocalizationDelegate({
    required this.ptBrLocalization,
    required this.enUsLocalization,
  });

  AppLocalizations? appLocalizations;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    )!;
  }

  @override
  bool isSupported(Locale locale) {
    _lastLocale = locale;
    return locale == const Locale("pt", "BR") ||
        locale == const Locale("en", "US");
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    appLocalizations = locale == const Locale("pt", "BR")
        ? ptBrLocalization
        : enUsLocalization;

    return appLocalizations!;
  }

  @override
  bool shouldReload(covariant AppLocalizationDelegate old) {
    return _lastLocale != old._lastLocale;
  }
}
