import 'package:eco/services/device_service.dart';
import 'package:eco/services/router/router.dart';
import 'package:eco/services/theme/theme_manager.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DeviceService().initPlatformState();

  runApp(MyApp());
}

extension ListSpaceBetweenExtension on List<Widget> {
  List<Widget> withSpaceBetween({double? width, double? height}) => [
        for (int i = 0; i < length; i++) ...[
          if (i > 0) SizedBox(width: width, height: height),
          this[i],
        ],
      ];
}

extension ListDividerBetweenExtension on List<Widget> {
  List<Widget> withDividerBetween({Color? colors = Colors.black38, double? height = 2}) => [
        for (int i = 0; i < length; i++) ...[
          if (i > 0) Divider(color: colors, height: height),
          this[i],
        ],
      ];
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
