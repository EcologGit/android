import 'package:auto_route/auto_route.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RoutesMarksPage extends StatelessWidget {
  const RoutesMarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map> myProducts = List.generate(12, (index) {
      return {"id": index, "name": "Product $index"};
    }).toList();

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: 195,
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: myProducts.length,
      itemBuilder: (BuildContext ctx, index) {
        return Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10),
              child: Text('Routes Marks $index'),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                height: 171,
                width: 171,
                ImgsControllerService.defaultImg.url('png'),
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    );
  }
}
