import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static const String themeMode = 'themeMode';
  static const String language = 'language';

  Future<bool> setThemeMode(ThemeMode theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool result = await prefs.setString(themeMode, theme.toString());

    return result;
  }

  Future<ThemeMode?> getThemeMode() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var result = prefs.getString(themeMode);

      if(result != null){
        if(result == 'ThemeMode.system'){
          return ThemeMode.system;
        }
        else if(result == 'ThemeMode.light'){
          return ThemeMode.light;
        }
        else if(result == 'ThemeMode.dark'){
          return ThemeMode.dark;
        }
      }
      return null;
    }
    catch(err){
      if (kDebugMode) {
        print(err);
      }
    }
    return null;
  }

  Future<bool> setLocale(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString(language, locale.languageCode);

    return result;
  }

  Future<Locale?> getLocale() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var result = prefs.getString(language);
      if(result != null){
        Locale a = Locale(result);
        return a;
      }
    }
    catch(err){
      if (kDebugMode) {
        print(err);
      }
    }
    return null;
  }
}