import 'package:auto_route/auto_route.dart';
import 'package:eco/bloc/login/login_bloc.dart';
import 'package:eco/services/authorization/repos/authentication_repository.dart';
import 'package:eco/services/router/router.dart';
import 'package:eco/services/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LogInProfilePage extends StatefulWidget {
  const LogInProfilePage({super.key});

  @override
  State<LogInProfilePage> createState() => _LogInProfilePageState();
}

class _LogInProfilePageState extends State<LogInProfilePage> {
  bool _passwordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value == null || !regex.hasMatch(value)) {
      return 'Введите корректный email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(context),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Вход'),
        ),
        body: BlocConsumer<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoginInitial || state is LoginSuccess) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) => validateEmail(value),
                              controller: controllerEmail,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                border: InputBorder.none,
                                hintText: 'Электронная почта',
                                hintStyle: TextStyle(
                                  color: ThemeManager.defaultPlaceholderColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const Divider(
                              height: 1,
                              indent: 20,
                            ),
                            TextFormField(
                              obscureText: !_passwordVisible,
                              validator: (value) => validatePassword(value),
                              controller: controllerPassword,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                border: InputBorder.none,
                                hintText: 'Пароль',
                                hintStyle: const TextStyle(
                                    color: ThemeManager.defaultPlaceholderColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginSubmitted(
                              username: controllerEmail.text, userPassword: controllerPassword.text));
                        },
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 5,
                          children: [
                            RotationTransition(
                              turns: const AlwaysStoppedAnimation(270 / 360),
                              child: Transform.scale(
                                scaleX: -1,
                                child: const Icon(
                                  Icons.key,
                                  size: 12,
                                ),
                              ),
                            ),
                            const Text('ВОЙТИ')
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginSubmitted(
                            username: controllerEmail.text, userPassword: controllerPassword.text));
                      },
                      child: const Wrap(
                        spacing: 10,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(
                            Icons.person_add,
                            size: 15,
                          ),
                          Text('ЗАРЕГИСТРИРОВАТЬСЯ'),
                        ],
                      ),
                    )
                  ],
                )),
              );
            } else {
              return Center(
                child: Text('Ошибка'),
              );
            }
          },
          listener: (BuildContext context, LoginState state) {
            final myRoute = AutoRouter.of(context);

            switch (state) {
              case LoginSuccess():
                myRoute.push(UserProfileRoute());
              case LoginLoading():
                break;
              case LoginFailure():
                break;
            }
          },
        ),
      ),
    );
  }
}
