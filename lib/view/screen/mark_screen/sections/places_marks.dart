import 'package:auto_route/auto_route.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PlacesMarksPage extends StatelessWidget {
  const PlacesMarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return true
        ? const Center(
            child: Text('Places'),
          )
        : GridView.builder(
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, childAspectRatio: 3 / 2, crossAxisSpacing: 15, mainAxisExtent: 15),
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 200,
                child: Column(
                  children: [
                    const Text('Name'),
                    ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        ImgsControllerService.defaultImg.url('png'),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
