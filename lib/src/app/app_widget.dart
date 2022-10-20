
// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../pages/splash/splash_page.dart';
import '../styles/custom_theme.dart';
import '../utils/cache.dart';
import '../utils/internationalization.dart';

ThemeMode? _themeMode = ThemeMode.dark;
Locale? _locale;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);
  
  @override
  State<AppWidget> createState() => _AppWidgetState();


  static void setTheme(BuildContext context, ThemeMode theme) {    
    _AppWidgetState? state = context.findAncestorStateOfType<_AppWidgetState>();

    Cache().setThemeMode(theme);

    state?.setState(() {
     _themeMode = theme;
    });
  }  

  static void setLocale(BuildContext context, Locale value) {    
    _AppWidgetState? state = context.findAncestorStateOfType<_AppWidgetState>();

    Cache().setLocale(value);

    state?.setState(() {
     _locale = value;
    });
  }  
}

class _AppWidgetState extends State<AppWidget> {

  
  @override
  void initState() {
    Timer.run(() async => await onLoad());
    super.initState();
  }

  onLoad() async {
    var t = await Cache().getThemeMode();
    if(t != null){
      setState(() {
        _themeMode = t;
      });
    }

    var l = await Cache().getLocale();
    if(l != null){
      setState(() {
        _locale = l;
      });
    }
    else{
      var locale = Platform.localeName.substring(0, 2);
      Cache().setLocale(Locale(locale));
      setState(() {
        _locale = Locale(locale);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(      
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
      locale: _locale,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: CustomThemeLight,
      darkTheme: CustomThemeDark,      
      themeMode: _themeMode,
      home: const SplashPage(),
    );
  }
}