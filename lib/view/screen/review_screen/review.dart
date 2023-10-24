import 'package:auto_route/auto_route.dart';
import 'package:eco/services/device_service.dart';
import 'package:eco/services/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    super.initState();
    DeviceService().initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        PlacesReviewRoute(),
        RoutesReviewRoute(),
        EventsReviewRoute(),
        SortPointsReviewRoute(),
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Обзор'),
            actions: const [
              Icon(Icons.search),
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SingleChildScrollView(scrollDirection: Axis.horizontal, child: NavigationButtonSection()),
              const SizedBox(height: 15),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NavigationButtonSection extends StatefulWidget {
  const NavigationButtonSection({super.key});

  @override
  State<NavigationButtonSection> createState() => _NavigationButtonSectionState();
}

class _NavigationButtonSectionState extends State<NavigationButtonSection> {
  final Map<String, int> pagesReview = {'place': 0, 'route': 1, 'event': 2, 'sortPoint': 3};
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
          createNavigationButton(icon: Icons.flag, label: 'МЕСТА', id: pagesReview['place']!),
          const SizedBox(width: 14),
          createNavigationButton(icon: Icons.route, label: 'МАРШРУТЫ', id: pagesReview['route']!),
          const SizedBox(width: 14),
          createNavigationButton(
              icon: Icons.celebration_rounded, label: 'МЕРОПРИЯТИЯ', id: pagesReview['event']!),
          const SizedBox(width: 14),
          createNavigationButton(
              icon: Icons.restore_from_trash_rounded,
              label: 'ТОЧКИ СОРТИРОВКИ',
              id: pagesReview['sortPoint']!),
        ],
      ),
    );
  }
}
