import 'package:auto_route/auto_route.dart';
import 'package:eco/bloc/sort_points/sort_point_detail/sort_point_detail.dart';
import 'package:eco/data/models/detail/sort_point_detail.dart';
import 'package:eco/main.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class SortPointDetailReviewPage extends StatelessWidget {
  const SortPointDetailReviewPage({@PathParam('id') this.sortPointId, super.key});

  final String? sortPointId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: UniqueKey(),
      create: (context) => SortPointDetailBloc()..add(LoadDetailOfSortPoint(sortPointId: sortPointId)),
      child: BlocBuilder<SortPointDetailBloc, SortPointDetailState>(
        builder: (context, state) {
          if (state is DetailSortPointLoading)
            return Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
          else if (state is DetailSortPointSuccess) {
            final SortPointDetail sortPoint = state.sortPoint;
            final String srcNetworkImage =
                '${ApiService(LocalAuthenticationService()).loadImage()}${sortPoint.photo}';
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Точка сортировки',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sortPoint.name ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Wrap(
                              spacing: 3,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.place,
                                  size: 12,
                                ),
                                Text(sortPoint.locality ?? ''),
                              ],
                            ),
                            Wrap(
                              spacing: 3,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.explore,
                                  size: 12,
                                ),
                                Text(sortPoint.latitudeN ?? ''),
                                Text(sortPoint.longitudeE ?? ''),
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
                                  sortPoint.schedule ?? '',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                            Wrap(
                              spacing: 10,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  ImgsControllerService.mapButton.url(),
                                  fit: BoxFit.cover,
                                ),
                                SvgPicture.asset(
                                  ImgsControllerService.favoriteButton.url(),
                                  fit: BoxFit.cover,
                                ),
                                SvgPicture.asset(
                                  ImgsControllerService.newReportButton.url(),
                                  fit: BoxFit.cover,
                                ),
                                SvgPicture.asset(
                                  ImgsControllerService.shareButton.url(),
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            Text(
                              sortPoint.description ?? '',
                            ),
                            const WasteWidget(),
                            if (state.natureObjects.results.isNotEmpty) ...[
                              CurrentObjects(
                                natureObjects: state.natureObjects.results,
                              ),
                            ],
                            if (false) ...[
                              CurrentRoutes(),
                            ],
                          ].withSpaceBetween(height: 12),
                        ),
                      ),
                    ],
                  ),
                ));
          } else {
            return Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          }
        },
      ),
    );
  }
}

class WasteWidget extends StatelessWidget {
  const WasteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Типы отходов',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.plasticRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Пластик',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.butteryRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Батарейки',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.lampRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Лампочки',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.paperRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Макулатура',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.metalRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Металл',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.glassRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Стекло',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ].withSpaceBetween(height: 12),
        ),
      ),
    );
  }
}

class CurrentObjects extends StatelessWidget {
  const CurrentObjects({super.key, required this.natureObjects});

  final natureObjects;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ближайшие объекты',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Row(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    color: Colors.black12,
                    height: 171,
                    width: 171,
                    child: Image.network(
                      '${ApiService(LocalAuthenticationService()).loadImage()}${natureObjects.first.photo}',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Image.asset(
                          height: 171,
                          width: 171,
                          ImgsControllerService.defaultImg.url('png'),
                          fit: BoxFit.cover,
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          height: 171,
                          width: 171,
                          ImgsControllerService.defaultImg.url('png'),
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: Text(
                    natureObjects.first.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            SizedBox(width: 15),
            if (natureObjects.length > 1)
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      color: Colors.black12,
                      height: 171,
                      width: 171,
                      child: Image.network(
                        '${ApiService(LocalAuthenticationService()).loadImage()}${natureObjects[1].photo}',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Image.asset(
                            height: 171,
                            width: 171,
                            ImgsControllerService.defaultImg.url('png'),
                            fit: BoxFit.cover,
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            height: 171,
                            width: 171,
                            ImgsControllerService.defaultImg.url('png'),
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                      width: 171,
                      child: Text(
                        natureObjects[1].name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )),
                ],
              ),
          ],
        ),
      ],
    );
  }
}

class CurrentRoutes extends StatelessWidget {
  const CurrentRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ближайшие маршруты',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Wrap(
          spacing: 18,
          children: [
            Wrap(
              direction: Axis.vertical,
              spacing: 10,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    height: 171,
                    width: 171,
                    ImgsControllerService.defaultImg.url('png'),
                    fit: BoxFit.cover,
                  ),
                ),
                const Text('Name')
              ],
            ),
            Wrap(
              direction: Axis.vertical,
              spacing: 10,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    height: 171,
                    width: 171,
                    ImgsControllerService.defaultImg.url('png'),
                    fit: BoxFit.cover,
                  ),
                ),
                const Text('Name')
              ],
            ),
          ],
        ),
      ],
    );
  }
}
