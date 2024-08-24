import 'package:flutter/widgets.dart';
import 'package:movie_spot/localization/app_localization_delegate.dart';
import 'package:movie_spot/localization/app_localizations.dart';

extension LocalizationContextExtensions on BuildContext {
  AppLocalizations get appLocalizations {
    return AppLocalizationDelegate.of(this);
  }
}

extension LocalizationStateExtensions on State {
  AppLocalizations get appLocalizations {
    return context.appLocalizations;
  }
}
