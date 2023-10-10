import 'package:auto_route/auto_route.dart';
import 'package:eco/services/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ReviewRoute(),
        ActivityRoute(),
        NewReportRoute(),
        MarksRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  tabsRouter.setActiveIndex(index);
                });
              },
              currentIndex: tabsRouter.activeIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Обзор',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Активность',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Новый отчет',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Отметки',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Профиль',
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              icon: const Icon(Icons.display_settings),
              onPressed: () {},
              label: const Text('ПАРАМЕТРЫ ПОИСКА'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            appBar: AppBar(
              title: const Text('Обзор'),
              actions: const [
                Icon(Icons.search),
              ],
            ),
            body: child);
      },
    );
  }
}
