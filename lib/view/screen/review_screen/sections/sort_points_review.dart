import 'package:auto_route/auto_route.dart';
import 'package:eco/bloc/sort_points/sort_points.dart';
import 'package:eco/data/models/sort_point.dart';
import 'package:eco/main.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:eco/services/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SortPointsReviewPage extends StatelessWidget {
  const SortPointsReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myRoute = AutoRouter.of(context);

    return BlocProvider(
      create: (context) => SortPointsBloc()..add(LoadSortPoints()),
      child: BlocBuilder<SortPointsBloc, SortPointsState>(
        builder: (context, state) {
          if (state is SortPointsLoading)
            return Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
          if (state is SortPointsSuccess) {
            final List<SortPoint> sortPoints = state.data.sortPoints;
            return ListView.separated(
              itemCount: sortPoints.length,
              itemBuilder: (BuildContext context, int index) {
                final SortPoint sortPoint = sortPoints[index];
                final String srcNetworkImage =
                    '${ApiService(LocalAuthenticationService()).loadImage()}${sortPoint.photo}';
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        myRoute.push(SortPointDetailReviewRoute(sortPointId: sortPoint.pointId.toString()));
                      },
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              color: Colors.black12,
                              height: 300,
                              width: double.infinity,
                              child: Image.network(
                                srcNetworkImage,
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Image.asset(
                                    ImgsControllerService.defaultImg.url('png'),
                                    fit: BoxFit.cover,
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    ImgsControllerService.defaultImg.url('png'),
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
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
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration:
                                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sortPoint.name,
                                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                                  ),
                                  Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.place,
                                        size: 12,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        sortPoint.locality,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    spacing: 3,
                                    children: [
                                      Icon(
                                        Icons.watch_later,
                                        size: 15,
                                      ),
                                      Text(
                                        sortPoint.schedule,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                  true
                                      ? Wrap(
                                          spacing: 5,
                                          alignment: WrapAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              ImgsControllerService.sortRating.url(),
                                              fit: BoxFit.cover,
                                            ),
                                            Text(
                                              sortPoint.wastTypes.first.name,
                                              style: TextStyle(
                                                fontSize: 17,
                                              ),
                                            )
                                          ],
                                        )
                                      : Wrap(
                                          spacing: 10,
                                          children: [
                                            Wrap(
                                              spacing: 5,
                                              alignment: WrapAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  ImgsControllerService.plasticRating.url(),
                                                  fit: BoxFit.cover,
                                                ),
                                                const Text(
                                                  '1',
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
                                                  ImgsControllerService.butteryRating.url(),
                                                  fit: BoxFit.cover,
                                                ),
                                                const Text(
                                                  '2',
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
                                                  ImgsControllerService.lampRating.url(),
                                                  fit: BoxFit.cover,
                                                ),
                                                const Text(
                                                  '3',
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
                                                  ImgsControllerService.paperRating.url(),
                                                  fit: BoxFit.cover,
                                                ),
                                                const Text(
                                                  '4',
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
                                                  ImgsControllerService.metalRating.url(),
                                                  fit: BoxFit.cover,
                                                ),
                                                const Text(
                                                  '5',
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
                                                  ImgsControllerService.glassRating.url(),
                                                  fit: BoxFit.cover,
                                                ),
                                                const Text(
                                                  '6',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                ].withSpaceBetween(height: 8),
                              ),
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
          return Center(
            child: Text('Ошибка'),
          );
        },
      ),
    );
  }
}
