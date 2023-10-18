import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TopActivityPage extends StatefulWidget {
  const TopActivityPage({super.key});

  @override
  State<TopActivityPage> createState() => _TopActivityPageState();
}

class _TopActivityPageState extends State<TopActivityPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Нет данных'),
    );
  }
}
