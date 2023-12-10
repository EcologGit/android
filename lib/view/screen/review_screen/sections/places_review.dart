import 'package:auto_route/auto_route.dart';
import 'package:eco/main.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:eco/services/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class PlacesReviewPage extends StatefulWidget {
  const PlacesReviewPage({super.key});

  @override
  State<PlacesReviewPage> createState() => _PlacesReviewPageState();
}

class _PlacesReviewPageState extends State<PlacesReviewPage> {
  @override
  Widget build(BuildContext context) {
    final myRoute = AutoRouter.of(context);
    return ListView.separated(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          alignment: Alignment.topRight,
          children: [
            GestureDetector(
              onTap: () {
                myRoute.push(PlaceDetailReviewRoute(placeId: index.toString()));
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(ImgsControllerService.defaultImg.url('png')),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Places',
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          const Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(
                                Icons.place,
                                size: 12,
                                color: Colors.black,
                              ),
                              Text(
                                'Location',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          Wrap(
                            spacing: 10,
                            children: [
                              Wrap(
                                spacing: 5,
                                alignment: WrapAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImgsControllerService.natureRating.url(),
                                    fit: BoxFit.cover,
                                  ),
                                  const Text(
                                    '0,0',
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  )
                                ],
                              ),
                              Wrap(
                                spacing: 5,
                                alignment: WrapAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImgsControllerService.routeRating.url(),
                                    fit: BoxFit.cover,
                                  ),
                                  const Text(
                                    '0,0',
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  )
                                ],
                              ),
                              Wrap(
                                spacing: 5,
                                children: [
                                  SvgPicture.asset(
                                    ImgsControllerService.sortRating.url(),
                                    fit: BoxFit.cover,
                                  ),
                                  const Text(
                                    '0,0',
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ].withSpaceBetween(height: 8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    iconSize: 50,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      ImgsControllerService.favoriteButton.url(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(
                    iconSize: 50,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      ImgsControllerService.shareButton.url(),
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15),
    );
  }
}
