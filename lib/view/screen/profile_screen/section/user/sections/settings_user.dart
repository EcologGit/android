import 'package:auto_route/auto_route.dart';
import 'package:eco/main.dart';
import 'package:eco/services/theme/theme_manager.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsUserPage extends StatefulWidget {
  const SettingsUserPage({super.key});

  @override
  State<SettingsUserPage> createState() => _SettingsUserPageState();
}

class _SettingsUserPageState extends State<SettingsUserPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const PersonalInfoWidget(),
          const ApplicationWidget(),
          const AccountWidget(),
        ].withSpaceBetween(height: 10),
      ),
    );
  }
}

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text('Личная информация', style: Theme.of(context).textTheme.titleMedium),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Name ',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                          size: 25,
                        )
                      ],
                    ),
                    title: Text('Имя'),
                    visualDensity: VisualDensity(vertical: -2),
                  ),
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'surname',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                          size: 25,
                        )
                      ],
                    ),
                    title: Text('Фамилия'),
                    visualDensity: VisualDensity(vertical: -2),
                  ),
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'sex',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                          size: 25,
                        )
                      ],
                    ),
                    title: Text('Пол'),
                    visualDensity: VisualDensity(vertical: -2),
                  ),
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '01.01.2000',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                          size: 25,
                        )
                      ],
                    ),
                    title: Text('Дата рождения'),
                    visualDensity: VisualDensity(vertical: -2),
                  ),
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Profession',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                          size: 25,
                        )
                      ],
                    ),
                    title: Text('Вид деятельности'),
                    visualDensity: VisualDensity(vertical: -2),
                  ),
                ].withDividerBetween()),
          ),
        ),
      ],
    );
  }
}

class ApplicationWidget extends StatelessWidget {
  const ApplicationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text('Приложение', style: Theme.of(context).textTheme.titleMedium),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    activeTrackColor: ThemeManager.activeColor,
                    value: true,
                    onChanged: (bool value) {},
                    visualDensity: const VisualDensity(vertical: -2),
                    title: const Text('Уведомления'),
                  ),
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Тема'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Светлая',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                          size: 25,
                        )
                      ],
                    ),
                    visualDensity: VisualDensity(vertical: -2),
                  ),
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Язык'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Русский',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                          size: 25,
                        )
                      ],
                    ),
                    visualDensity: VisualDensity(vertical: -2),
                  ),
                ].withDividerBetween()),
          ),
        ),
      ],
    );
  }
}

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text('Приложение', style: Theme.of(context).textTheme.titleMedium),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Никнейм'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'username',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: 25,
                      )
                    ],
                  ),
                  visualDensity: VisualDensity(vertical: -2),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Номер телефона'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '+7(000)000-00-00',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: 25,
                      )
                    ],
                  ),
                  visualDensity: VisualDensity(vertical: -2),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Электронная почта'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'example@email.com',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: 25,
                      )
                    ],
                  ),
                  visualDensity: VisualDensity(vertical: -2),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Пароль'),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 25,
                  ),
                  visualDensity: VisualDensity(vertical: -2),
                ),
              ].withDividerBetween(),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 4, bottom: 12),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
            ),
            child: const Wrap(
              spacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(Icons.logout, size: 15),
                Text('ВЫЙТИ ИЗ АККАУНТА'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
