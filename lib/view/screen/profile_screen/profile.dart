import 'package:auto_route/auto_route.dart';
import 'package:eco/bloc/authentication/authentication_bloc.dart';
import 'package:eco/services/authorization/repos/authentication_repository.dart';
import 'package:eco/services/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final myRoute = AutoRouter.of(context);
    return AutoTabsRouter.pageView(
      routes: const [
        UserProfileRoute(),
        LogInProfileRoute(),
        SignInProfileRoute(),
      ],
      builder: (context, child, _) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                myRoute.push(UserProfileRoute());
              case AuthenticationStatus.unauthenticated:
                break;

              case AuthenticationStatus.unknown:
                break;
            }
          },
          child: Scaffold(body: child),
        );
      },
    );
  }
}
