
// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:star_wars/src/app/app_configs.dart';

import '../pages/splash/splash_page.dart';
import '../styles/custom_theme.dart';
import '../utils/cache.dart';
import '../utils/internationalization.dart';

// ThemeMode? _themeMode = ThemeMode.dark;
// Locale? _locale;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);
  
  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  AppConfigs configs = AppConfigs();
  
  @override
  void initState() {
    Timer.run(() async => await onLoad());
    super.initState();
  }

  onLoad() async {
    var t = await Cache().getThemeMode();
    if(t != null){
      configs.setThemeMode(t);
    }

    var l = await Cache().getLocale();
    if(l != null){
      configs.setLocale(l);
    }
    else{
      var locale = Platform.localeName.substring(0, 2);
      Cache().setLocale(Locale(locale));
      configs.setLocale(Locale(locale));
      configs.setLocale(Locale(locale));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: configs,
      builder: (_, __) => MaterialApp(      
        localizationsDelegates: const [
          LocaleTextsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt'),
          Locale('en'),
        ],
        locale: configs.locale,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: CustomThemeLight,
        darkTheme: CustomThemeDark,      
        themeMode: configs.themeMode,
        home: const SplashPage(),
      ),
    );
  }
}