import 'package:auto_route/auto_route.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PlacesMarksPage extends StatelessWidget {
  const PlacesMarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map> myProducts = List.generate(12, (index) {
      return {"id": index, "name": "Product $index"};
    }).toList();

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: 171,
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: myProducts.length,
      itemBuilder: (BuildContext ctx, index) {
        return GridTile(
          header: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Colors.black26,
            ),
            height: 40,
            child: Center(
              child: Text('Places Marks $index'),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              height: 171,
              width: 171,
              ImgsControllerService.defaultImg.url('png'),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
