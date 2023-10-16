import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(title: const Text('Вход')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) => validateEmail(value),
                    controller: controllerEmail,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        border: InputBorder.none,
                        hintText: 'Электронная почта',
                        hintStyle:
                            TextStyle(color: Colors.grey[400], fontSize: 17, fontWeight: FontWeight.w400)),
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
                      hintStyle:
                          TextStyle(color: Colors.grey[400], fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
