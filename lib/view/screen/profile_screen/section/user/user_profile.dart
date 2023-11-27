import 'package:auto_route/auto_route.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:eco/services/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [UserCardDataWidget(), ListDataUserWidget()],
        ),
      ),
    );
  }
}

class UserCardDataWidget extends StatelessWidget {
  const UserCardDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  ImgsControllerService.defaultImg.url('png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Name\nSurname', style: Theme.of(context).textTheme.bodyLarge),
                  const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.place,
                        size: 15,
                      ),
                      Text('Locality'),
                    ],
                  ),
                  const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.cake,
                        size: 15,
                      ),
                      Text('01.01.2000'),
                    ],
                  ),
                  const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.business_center,
                        size: 15,
                      ),
                      Text('Profession'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListDataUserWidget extends StatelessWidget {
  const ListDataUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AutoTabsRouter(
        routes: const [
          ReportsUserRoute(),
          StatisticsUserRoute(),
          SettingsUserRoute(),
        ],
        builder: (context, child) {
          return Column(
            children: [
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: NavigationButtonSection(),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: child,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class NavigationButtonSection extends StatefulWidget {
  const NavigationButtonSection({super.key});

  @override
  State<NavigationButtonSection> createState() => _NavigationButtonSectionState();
}

class _NavigationButtonSectionState extends State<NavigationButtonSection> {
  final Map<String, int> pagesReview = {'reports': 0, 'statistics': 1, 'settings': 2};
  List<int> selectedCategory = [];

  Widget createNavigationButton({
    required IconData icon,
    required String label,
    required int id,
  }) {
    final tabsRouter = AutoTabsRouter.of(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        foregroundColor: selectedCategory.contains(id) ? Colors.white : const Color.fromRGBO(36, 40, 44, 1),
        backgroundColor:
            selectedCategory.contains(id) ? Colors.black : const Color.fromRGBO(211, 243, 107, 1),
      ),
      onPressed: () {
        selectedCategory = [];
        selectedCategory.add(id);
        setState(() {
          tabsRouter.setActiveIndex(id);
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    selectedCategory.add(pagesReview.values.first);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          createNavigationButton(icon: Icons.description, label: 'ОТЧЕТЫ', id: pagesReview['reports']!),
          const SizedBox(width: 14),
          createNavigationButton(icon: Icons.analytics, label: 'СТАТИСТИКА', id: pagesReview['statistics']!),
          const SizedBox(width: 14),
          createNavigationButton(icon: Icons.settings, label: 'НАСТРОЙКА', id: pagesReview['settings']!),
          const SizedBox(width: 14),
        ],
      ),
    );
  }
}
