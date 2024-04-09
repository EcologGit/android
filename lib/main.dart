import 'package:eco/bloc/authentication/authentication_bloc.dart';
import 'package:eco/services/authorization/repos/authentication_repository.dart';
import 'package:eco/services/authorization/repos/user_repository.dart';
import 'package:eco/services/device_service.dart';
import 'package:eco/services/router/router.dart';
import 'package:eco/services/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DeviceService().initPlatformState();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthenticationRepository _authenticationRepository;

  late final UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: _authenticationRepository,
          userRepository: _userRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
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
