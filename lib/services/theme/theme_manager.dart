import 'package:flutter/material.dart';

class ThemeManager {
  static const defaultColorDart = Color.fromRGBO(36, 40, 44, 1);
  static const activeColor = Color.fromRGBO(211, 243, 107, 1);
  static const activeColorDim = Color.fromRGBO(223, 240, 165, 1);

  static const defaultBackgroundColor = Color.fromRGBO(247, 246, 240, 1.0);
  static const defaultPlaceholderColor = Color.fromRGBO(189, 189, 189, 1);

  ThemeData get getThemeDataAndroid => _themeDataAndroid;

  final _themeDataAndroid = ThemeData(
    fontFamily: "Pro-Rounded-Regular",
    useMaterial3: true,
    scaffoldBackgroundColor: defaultBackgroundColor,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: ThemeManager.defaultBackgroundColor,
      backgroundColor: defaultBackgroundColor,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 34,
        color: defaultColorDart,
      ),
    ),
    iconTheme: const IconThemeData(
      color: defaultColorDart,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: activeColor,
        foregroundColor: defaultColorDart,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: IconThemeData(color: defaultColorDart),
      selectedIconTheme: IconThemeData(color: activeColor),
      selectedItemColor: activeColor,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedLabelStyle: TextStyle(fontSize: 11),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: defaultColorDart,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: defaultColorDart,
      foregroundColor: Colors.white,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: activeColor,
      selectionColor: activeColorDim,
      selectionHandleColor: activeColor,
    ),
  );
}
