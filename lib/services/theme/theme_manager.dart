import 'package:flutter/material.dart';

class ThemeManager {
  static const mainColor = Color.fromRGBO(247, 246, 240, 1.0);
  static const defaultColor = Color.fromRGBO(36, 40, 44, 1);
  static const activeColor = Color.fromRGBO(211, 243, 107, 1);
  static const calendarColor = mainColor;
  static const defaultBachgroundColor = Color.fromRGBO(247, 246, 240, 1.0);

  ThemeData get getThemeDataAndroid => _themeDataAndroid;

  final _themeDataAndroid = ThemeData(
    // fontFamily: "Pro-Rounded-Regular",
    useMaterial3: true,
    scaffoldBackgroundColor: defaultBachgroundColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: defaultBachgroundColor,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 34, color: defaultColor)),
    iconTheme: IconThemeData(
      color: Colors.grey[400],
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(211, 243, 107, 1)),
        foregroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(36, 40, 44, 1)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: IconThemeData(color: defaultColor),
      selectedIconTheme: IconThemeData(color: activeColor),
      selectedItemColor: activeColor,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedLabelStyle: TextStyle(fontSize: 11),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromRGBO(36, 40, 44, 1), foregroundColor: Colors.white),
  );
}
