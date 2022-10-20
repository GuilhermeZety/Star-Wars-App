


// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../utils/util.dart';

ThemeData CustomThemeDark = ThemeData(
  snackBarTheme: const SnackBarThemeData(
    contentTextStyle: TextStyle(color: Color(0xFF2D3140)),
    elevation: 7,
  ),    
  primaryColor: const Color(0xFFFFE81F),
  secondaryHeaderColor: const Color(0xFFC1C1C1),
  canvasColor: const Color(0xFFAAAAAA),
  backgroundColor: Colors.black,     
  cardColor: Colors.transparent,      
  scaffoldBackgroundColor: const Color(0xFF1C1C1C),        
  primarySwatch: createMaterialColor(const Color(0xFFFFE81F)),         
  // cardColor: const Color(0xFFAAAAAA),
  colorScheme: const ColorScheme.dark().copyWith(
    primaryContainer: const Color(0xFF2C2C2C),
    secondaryContainer: const Color(0xFF181818),
    primary: const Color(0xFFFFE81F),
    secondary: const Color(0xFFFFE81F).withOpacity(0.8),

  ),
  unselectedWidgetColor:const Color(0xFFD6D6D6),
  brightness: Brightness.dark,
  textTheme:  const TextTheme(
    headline1: TextStyle(color: Color(0xFFD6D6D6), fontSize: 16),
    headline2: TextStyle(color: Color(0xFFD6D6D6), fontSize: 16),
    bodyText2: TextStyle(color: Color(0xFFD6D6D6), fontSize: 16),
    subtitle1: TextStyle(color: Color(0xFFD6D6D6), fontSize: 16),
    headline6: TextStyle(color: Color(0xFFC3C3C3), fontSize: 16)
  ),
  fontFamily: 'Arimo',
  iconTheme: const IconThemeData(color: Colors.white)
);

ThemeData CustomThemeLight = ThemeData(
  snackBarTheme: const SnackBarThemeData(
    contentTextStyle: TextStyle(color: Color(0xFF2D3140)),
    elevation: 7,
  ),    
  primaryColor: const Color(0xFF080768),
  secondaryHeaderColor: const Color(0xFF737373),
  canvasColor: const Color(0xFF737373),
  backgroundColor: Colors.white,     
  cardColor: Colors.transparent,      
  scaffoldBackgroundColor: const Color(0xFFFBFBFB),        
  primarySwatch: createMaterialColor(const Color(0xFF080768)),         
  // cardColor: const Color(0xFFAAAAAA),
  colorScheme: const ColorScheme.dark().copyWith(
    primaryContainer: Colors.white,
    secondaryContainer: const Color(0xFFEFEFEF),
    primary: const Color(0xFF080768),
    secondary: const Color(0xFF080768).withOpacity(0.8),
  ),
  unselectedWidgetColor:const Color(0xFF333232),
  brightness: Brightness.dark,
  textTheme:  const TextTheme(
    headline1: TextStyle(color: Color(0xFF333232), fontSize: 16),
    headline2: TextStyle(color: Color(0xFF333232), fontSize: 16),
    bodyText2: TextStyle(color: Color(0xFF333232), fontSize: 16),
    subtitle1: TextStyle(color: Color(0xFF333232), fontSize: 16),
    headline6: TextStyle(color: Color(0xFF474646), fontSize: 16)
  ),
  fontFamily: 'Arimo',
  iconTheme: const IconThemeData(color: Colors.white)
);