import 'package:eco/services/theme/theme_manager.dart';
import 'package:eco/view/screen/review_screen/review.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Обзор',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager().getThemeDataAndroid,
      home: const ReviewScreen(),
    );
  }
}
