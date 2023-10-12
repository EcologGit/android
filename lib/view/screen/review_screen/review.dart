import 'package:auto_route/auto_route.dart';
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
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        PlacesReviewRoute(),
        EventsReviewRoute(),
        RoutesReviewRoute(),
        SortPointsReviewRoute(),
      ],
      builder: (context, child) {
        return Scaffold(
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
  List<int> selectedCategory = [0];

  final int place = 0;
  final int route = 1;
  final int event = 2;
  final int sortPoint = 3;

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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          createNavigationButton(icon: Icons.flag, label: 'МЕСТА', id: place),
          const SizedBox(width: 14),
          createNavigationButton(icon: Icons.route, label: 'МАРШРУТЫ', id: route),
          const SizedBox(width: 14),
          createNavigationButton(icon: Icons.celebration_rounded, label: 'МЕРОПРИЯТИЯ', id: event),
          const SizedBox(width: 14),
          createNavigationButton(
              icon: Icons.restore_from_trash_rounded, label: 'ТОЧКИ СОРТИРОВКИ', id: sortPoint),
        ],
      ),
    );
  }
}
