import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ThemeProvider {
  static Color get primaryColor => Color(0xFFF6CD61);

  static Color get primaryColorLight => Color(0xFFFFEBA1);

  static Color get primaryColorDark => Color(0xFFC09C31);

  static Color get accentColor => Colors.grey;

  static Color get textColorLight => Colors.grey;

  static Color get textColor => Colors.white;

  ThemeData getThemeData() {
    return ThemeData(
      primaryColor: primaryColor,
      primaryColorLight: primaryColorLight,
      primaryColorDark: primaryColorDark,
      accentColor: accentColor,
      fontFamily: 'Lato',
      brightness: Brightness.light,
      textTheme: TextTheme(
        button: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      buttonTheme: ButtonThemeData(
        padding: EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        buttonColor: primaryColor,
      ),
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        iconTheme: IconThemeData(
          color: textColor,
        ),
        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
