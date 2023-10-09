import 'package:flutter/material.dart';

class ThemeManager {
  static const mainColor = Color.fromRGBO(247, 246, 240, 1.0);
  static const iconDefaultColor = Colors.grey;
  static const drawerColor = Color.fromRGBO(41, 99, 113, 1);
  static const calendarColor = mainColor;

  ThemeData get getThemeDataAndroid => _themeDataAndroid;

  final _themeDataAndroid = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color.fromRGBO(247, 246, 240, 1.0),
    iconTheme: IconThemeData(
      color: Colors.grey[400],
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(211, 243, 107, 1)),
        foregroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(36, 40, 44, 1)),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromRGBO(36, 40, 44, 1), foregroundColor: Colors.white),
  );
}
