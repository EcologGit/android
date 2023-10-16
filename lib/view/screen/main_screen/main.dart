import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:eco/services/router/router.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const colorDefaultIcon = Color.fromRGBO(211, 243, 107, 1);

class _MainScreenState extends State<MainScreen> {
  createBottomNavigation({
    required String assetName,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        assetName,
        fit: BoxFit.cover,
      ),
      activeIcon: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: ColorFiltered(
          colorFilter: const ColorFilter.mode(
            colorDefaultIcon,
            BlendMode.lighten,
          ),
          child: SvgPicture.asset(
            assetName,
          ),
        ),
      ),
      label: label,
    );
  }

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
            items: [
              createBottomNavigation(
                  assetName: ImgsControllerService.reviewBottomNavigation.url('svg'), label: 'Обзор'),
              createBottomNavigation(
                  assetName: ImgsControllerService.activityBottomNavigation.url('svg'), label: 'Активность'),
              createBottomNavigation(
                  assetName: ImgsControllerService.newReportBottomNavigation.url('svg'),
                  label: 'Новый отчет'),
              createBottomNavigation(
                  assetName: ImgsControllerService.marksBottomNavigation.url('svg'), label: 'Отметки'),
              createBottomNavigation(
                  assetName: ImgsControllerService.profileBottomNavigation.url('svg'), label: 'Профиль'),
            ],
          ),
          floatingActionButton: SizedBox(
            height: 44,
            child: FloatingActionButton.extended(
              icon: const RotationTransition(
                  turns: AlwaysStoppedAnimation(90 / 360), child: Icon(Icons.tune, size: 20)),
              onPressed: () {},
              label: const Text('ПАРАМЕТРЫ ПОИСКА',
                  style: TextStyle(
                    fontSize: 14,
                  )),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: child,
        );
      },
    );
  }
}
