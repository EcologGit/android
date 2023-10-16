import 'package:eco/services/device_service.dart';
import 'package:eco/services/router/router.dart';
import 'package:eco/services/theme/theme_manager.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DeviceService().initPlatformState();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Обзор',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager().getThemeDataAndroid,
      routerConfig: _router.config(),
    );
  }
}
