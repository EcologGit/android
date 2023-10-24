import 'package:auto_route/auto_route.dart';
import 'package:eco/services/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ReportActivityRoute(),
        TopActivityRoute(),
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Активность'),
            actions: const [
              Icon(Icons.search),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              const NavigationButtonSection(),
              const SizedBox(height: 15),
              Expanded(
                child: child,
              ),
            ]),
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
  final Map<String, int> pagesReview = {'report': 0, 'top': 1};
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
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
          Icon(
            icon,
            size: 20,
          ),
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
    return Row(
      children: [
        Expanded(
          child: createNavigationButton(icon: Icons.description, id: pagesReview['report']!, label: 'ОТЧЕТЫ'),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: createNavigationButton(icon: Icons.star, id: pagesReview['top']!, label: 'ТОПЫ'),
        ),
      ],
    );
  }
}
