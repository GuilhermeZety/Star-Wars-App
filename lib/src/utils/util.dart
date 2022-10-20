import 'package:flutter/material.dart';

import 'internationalization.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

String genderTradutor(context, gender){
  if(gender == 'n/a'){
    return LocaleTexts.of(context).getText('unknown');
  }
  else if(gender == 'male'){
    return LocaleTexts.of(context).getText('male');
  }
  else if(gender == 'female'){
    return LocaleTexts.of(context).getText('female');
  }
  else{
    return 'Error';
  }
}

String simplifyThemeMode(String theme){
    if(theme == 'ThemeMode.system'){
      return 'system';
    }
    else if(theme == 'ThemeMode.light'){
      return 'light';
    }
    else if(theme == 'ThemeMode.dark'){
      return 'dark';
    }
    return '';
}