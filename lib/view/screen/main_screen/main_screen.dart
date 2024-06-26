import 'package:auto_route/auto_route.dart';
import 'package:eco/services/theme/theme_manager.dart';
import 'package:flutter/foundation.dart';
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
            ThemeManager.activeColor,
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
        // MarksRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        final childRouter = context.topRoute.router.currentPath;

        List<String> inactiveFloatingButtonList = [
          '/main/activity/top_activity',
          '/main/marks/places_marks',
          '/main/marks/routes_marks',
          '/main/marks/events_marks',
          '/main/marks/sort_points_marks',
          '/main/new_report',
          '/main/profile/log_in',
          '/main/profile/sign_in',
          '/main/profile/user_profile',
          '/main/profile/user_profile/statistics_user',
          '/main/profile/user_profile/settings_user',
          '/main/profile/user_profile/reports_user',
        ];

        if (kDebugMode) {
          print(childRouter);
        }

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
                  assetName: ImgsControllerService.reviewBottomNavigation.url(), label: 'Обзор'),
              createBottomNavigation(
                  assetName: ImgsControllerService.activityBottomNavigation.url(), label: 'Активность'),
              createBottomNavigation(
                  assetName: ImgsControllerService.newReportBottomNavigation.url(), label: 'Новый отчет'),
              // createBottomNavigation(
              //     assetName: ImgsControllerService.marksBottomNavigation.url(), label: 'Отметки'),
              createBottomNavigation(
                  assetName: ImgsControllerService.profileBottomNavigation.url(), label: 'Профиль'),
            ],
          ),
          // floatingActionButton: inactiveFloatingButtonList.contains(childRouter)
          floatingActionButton: true
              ? const SizedBox()
              : SizedBox(
                  height: 44,
                  child: FloatingActionButton.extended(
                    icon: const RotationTransition(
                      turns: AlwaysStoppedAnimation(90 / 360),
                      child: Icon(Icons.tune, size: 14),
                    ),
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
