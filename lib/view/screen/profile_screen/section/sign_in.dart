import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:eco/services/theme/theme_manager.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class SignInProfilePage extends StatefulWidget {
  const SignInProfilePage({super.key});

  @override
  State<SignInProfilePage> createState() => _SignInProfilePageState();
}

class _SignInProfilePageState extends State<SignInProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const SignInProfileWidget();
  }
}

class SignInProfileWidget extends StatefulWidget {
  const SignInProfileWidget({super.key});

  @override
  State<SignInProfileWidget> createState() => _SignInProfileWidgetState();
}

class _SignInProfileWidgetState extends State<SignInProfileWidget> {
  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerNickname = TextEditingController();
  TextEditingController controllerDB = TextEditingController();
  TextEditingController controllerActivity = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerRepeatPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _repeatPasswordVisible = false;

  String? validateName(String? value) {
    if (value == null || value.length < 2 || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return 'Имя состоит минимум из 2-х символов';
    } else {
      return null;
    }
  }

  String? validateNickname(String? value) {
    if (value == null || value.length < 2) {
      return 'Никнейм состоит минимум из 2-х символов';
    } else {
      return null;
    }
  }

  String? validateMobile(String? value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

    RegExp regExp = RegExp(patttern);
    if (value == null || value.isEmpty) {
      return 'Введите мобильный номер';
    } else if (!regExp.hasMatch(value)) {
      return 'Введите корректный мобильный номер';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value == null || !regex.hasMatch(value)) {
      return 'Введите корректный email';
    } else {
      return null;
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final today = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 360)),
      initialDate: today,
      lastDate: today,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      final date = DateFormat.yMMMMd('ru').format(picked).toString();

      controllerDB.text = date;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  List<DropdownMenuItem<String>> get dropdownGender {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: 'жен', child: Text('Женский')),
      const DropdownMenuItem(value: 'муж', child: Text('Мужской')),
    ];
    return menuItems;
  }

  final Uri _url = Uri.parse('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    String? selectedGender;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                        cursorColor: ThemeManager.activeColor,
                        validator: (value) => validateName(value),
                        controller: controllerFirstName,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          focusColor: ThemeManager.activeColor,
                          border: InputBorder.none,
                          hintText: 'Имя',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(189, 189, 189, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const Divider(
                        height: 1,
                        indent: 20,
                      ),
                      TextFormField(
                        cursorColor: ThemeManager.activeColor,
                        validator: (value) => validateName(value),
                        controller: controllerLastName,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          hintText: 'Фамилия',
                          hintStyle: TextStyle(
                            color: ThemeManager.defaultPlaceholderColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                          focusColor: ThemeManager.activeColor,
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const Divider(
                        height: 1,
                        indent: 20,
                      ),
                      TextFormField(
                        cursorColor: ThemeManager.activeColor,
                        validator: (value) => validateName(value),
                        controller: controllerNickname,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          hintText: 'Никнейм',
                          hintStyle: TextStyle(
                            color: ThemeManager.defaultPlaceholderColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                          focusColor: Color.fromARGB(255, 19, 20, 19),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const Divider(
                        height: 1,
                        indent: 20,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          border: InputBorder.none,
                        ),
                        hint: const Text('Пол'),
                        iconSize: 13,
                        icon: const Icon(Icons.arrow_forward_ios),
                        validator: (value) => value == null ? 'Не выбран' : null,
                        dropdownColor: Colors.white,
                        value: selectedGender,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGender = newValue!;
                          });
                        },
                        items: dropdownGender,
                      ),
                      const Divider(
                        height: 1,
                        indent: 20,
                      ),
                      TextFormField(
                        validator: (value) => value == null ? 'Выберите дату' : null,
                        readOnly: true,
                        controller: controllerDB,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          suffixIcon: Icon(Icons.calendar_month_outlined),
                          hintText: 'Дата рождения',
                          border: InputBorder.none,
                        ),
                        onTap: () {
                          selectDate(context);
                        },
                      ),
                      const Divider(
                        height: 1,
                        indent: 20,
                      ),
                      TextFormField(
                        cursorColor: ThemeManager.activeColor,
                        validator: (value) => validateName(value),
                        controller: controllerActivity,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          hintText: 'Вид деятельности',
                          hintStyle: TextStyle(
                            color: ThemeManager.defaultPlaceholderColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const Divider(
                        height: 1,
                        indent: 20,
                      ),
                      TextFormField(
                        cursorColor: ThemeManager.activeColor,
                        validator: (value) => validateMobile(value),
                        controller: controllerPhone,
                        maxLength: 15,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          border: InputBorder.none,
                          counterText: '',
                          hintText: 'Мобильный телефон',
                          hintStyle: TextStyle(
                            color: ThemeManager.defaultPlaceholderColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const Divider(
                        height: 1,
                        indent: 20,
                      ),
                      TextFormField(
                        cursorColor: ThemeManager.activeColor,
                        validator: (value) => validateEmail(value),
                        controller: controllerEmail,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          hintText: 'Электронная почта',
                          hintStyle: TextStyle(
                            color: ThemeManager.defaultPlaceholderColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const Divider(
                        height: 1,
                        indent: 20,
                      ),
                      TextFormField(
                        cursorColor: ThemeManager.activeColor,
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
                      const Divider(
                        height: 1,
                        indent: 20,
                      ),
                      TextFormField(
                        cursorColor: ThemeManager.activeColor,
                        obscureText: !_repeatPasswordVisible,
                        validator: (value) => validatePassword(value),
                        controller: controllerRepeatPassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _repeatPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _repeatPasswordVisible = !_repeatPasswordVisible;
                              });
                            },
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          border: InputBorder.none,
                          hintText: 'Повторите пароль',
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
                  style: ElevatedButton.styleFrom(backgroundColor: ThemeManager.defaultColorDart),
                  onPressed: () {},
                  child: const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 12,
                        color: Colors.white,
                      ),
                      Text(
                        'ДОБАВИТЬ ФОТО',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -1,
                        color: Colors.black,
                      ),
                      text: 'Нажимая на кнопку «Зарегистрироваться», Вы соглашаетесь с ',
                      children: [
                        TextSpan(
                          text: 'Условиями использования сервиса',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _launchUrl();
                            },
                        ),
                      ],
                    ),
                  )),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (kDebugMode) {
                      print('nice');
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: const Text('ОТПРАВИТЬ'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
