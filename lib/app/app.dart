import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_spot/app/providers/localization_provider.dart';
import 'package:movie_spot/app/providers/theme_provider.dart';
import 'package:movie_spot/localization/app_localization_delegate.dart';
import 'package:movie_spot/localization/en_us/en_us.dart';
import 'package:movie_spot/localization/pt_br/pt_br.dart';
import 'package:movie_spot/router/app_router.dart';
import 'package:movie_spot/utils/localization/localization_utils.dart';
import 'package:movie_spot/utils/theme/AppTheme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale? _locale;
  ThemeMode? _themeMode;

  void _setLocale(Locale locale) => {setState(() => _locale = locale)};

  void _setTheme(ThemeMode theme) => {setState(() => _themeMode = theme)};

  @override
  void initState() {
    super.initState();
    // TODO depois arrumar essa gambiarra: iniciar as configurações de localização em uma splash screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final deviceLocale = View.of(context).platformDispatcher.locale;
      setState(() {
        _locale = LocalizationUtils.getSupportedLocale(deviceLocale);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO depois arrumar essa gambiarra: iniciar as configurações de localização em uma splash screen
    if (_locale == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return LocalizationProvider(
      locale: _locale!,
      setLocale: _setLocale,
      child: ThemeProvider(
        themeMode: _themeMode,
        setThemeMode: _setTheme,
        child: MaterialApp(
            locale: _locale,
            themeMode: _themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            routes: AppRouter().routes,
            initialRoute: "/",
            localizationsDelegates: _localizationsDelegates,
            supportedLocales: _supportedLocales,
            debugShowCheckedModeBanner: false,
          ),
        ),
    );
  }

  Iterable<Locale> get _supportedLocales =>
      const [Locale("pt", "BR"), Locale("en", "US")];

  Iterable<LocalizationsDelegate<dynamic>>? get _localizationsDelegates => [
        AppLocalizationDelegate(
          ptBrLocalization: PtBr(),
          enUsLocalization: EnUs(),
        ),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];
}
