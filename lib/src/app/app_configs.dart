

import 'package:flutter/material.dart';
import 'package:star_wars/src/utils/cache.dart';

class AppConfigs extends ChangeNotifier{
  AppConfigs._();

  static final AppConfigs _instance = AppConfigs._();
  factory AppConfigs() => AppConfigs._instance;

  ThemeMode themeMode = ThemeMode.dark;
  Locale locale = Locale('pt');
  
  void setThemeMode(ThemeMode _) {
    Cache().setThemeMode(_);
    themeMode = _;
    notifyListeners();
  } 
  
  void setLocale(Locale _) {
    Cache().setLocale(_);
    locale = _;
    notifyListeners();
  } 
}