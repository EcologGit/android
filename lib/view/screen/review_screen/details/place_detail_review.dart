import 'package:auto_route/auto_route.dart';
import 'package:eco/bloc/places/place_detail/place_detail.dart';
import 'package:eco/data/models/detail/place_detail.dart';
import 'package:eco/data/models/reports_of_object.dart';
import 'package:eco/main.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

@RoutePage()
class PlaceDetailReviewPage extends StatelessWidget {
  const PlaceDetailReviewPage({@PathParam('id') this.placeId, super.key});

  final String? placeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: UniqueKey(),
      create: (context) => PlaceDetailBloc()..add(LoadDetailOfPlace(placeId: placeId)),
      child: BlocBuilder<PlaceDetailBloc, PlaceDetailState>(
        builder: (context, state) {
          if (state is DetailPlaceLoading)
            return Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
          else if (state is DetailPlaceSuccess) {
            final PlaceDetail place = state.place;
            final String srcNetworkImage =
                '${ApiService(LocalAuthenticationService()).loadImage()}${place.objectInfo.photo}';
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Место',
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
                            place.objectInfo.name ?? '',
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
                              Text(place.objectInfo.name ?? ''),
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
                              Text(place.objectInfo.name ?? ''),
                              Text(place.objectInfo.name ?? ''),
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
                          Text(place.objectInfo.name ?? ''),
                          RatingWidget(place: state.place),
                          WasteWidget(),
                          if (state.actualsEvents.results.isNotEmpty) ...[
                            CurrentEvents(
                              actualsEvents: state.actualsEvents.results,
                            ),
                          ],
                          if (state.nearestSortPoints.results.isNotEmpty) ...[
                            CurrentSortPoints(
                              nearestSortPoints: state.nearestSortPoints.results,
                            ),
                          ],
                          if (false) ...[
                            ReportsWidget(
                              reportsOfObject: state.reportsOfObject,
                            ),
                          ],
                        ].withSpaceBetween(height: 12),
                      ),
                    ),
                  ],
                ),
              ),
            );
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

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.place,
  });

  final PlaceDetail place;

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
        child: BlocBuilder<PlaceDetailBloc, PlaceDetailState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Рейтинг',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      spacing: 8,
                      alignment: WrapAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImgsControllerService.routeRating.url(),
                          fit: BoxFit.cover,
                        ),
                        const Text(
                          'Доступность',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                    Text(
                      place.objectInfo.avgAvailability == null
                          ? '0.0'
                          : place.objectInfo.avgAvailability.toString(),
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
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
                          ImgsControllerService.natureRating.url(),
                          fit: BoxFit.cover,
                        ),
                        const Text(
                          'Красота',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                    Text(
                      place.objectInfo.avgBeauty == null ? '0.0' : place.objectInfo.avgBeauty.toString(),
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
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
                          ImgsControllerService.sortRating.url(),
                          fit: BoxFit.cover,
                        ),
                        const Text(
                          'Чистота',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                    Text(
                      place.objectInfo.avgPurity == null ? '0.0' : place.objectInfo.avgPurity.toString(),
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ].withSpaceBetween(height: 12),
            );
          },
        ),
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
              'Собранные отходы',
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
                const Text(
                  '0,0 кг',
                  style: TextStyle(
                    fontSize: 17,
                  ),
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
                const Text(
                  '0,0 кг',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )
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
                const Text(
                  '0,0 кг',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )
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
                const Text(
                  '0,0 кг',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )
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
                const Text(
                  '0,0 кг',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )
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
                const Text(
                  '0,0 кг',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )
              ],
            ),
          ].withSpaceBetween(height: 12),
        ),
      ),
    );
  }
}

class CurrentEvents extends StatelessWidget {
  const CurrentEvents({super.key, required this.actualsEvents});

  final actualsEvents;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Мероприятия',
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
                      '${ApiService(LocalAuthenticationService()).loadImage()}${actualsEvents.first.photo}',
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
                    actualsEvents.first.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            SizedBox(width: 15),
            if (actualsEvents.length > 1)
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      color: Colors.black12,
                      height: 171,
                      width: 171,
                      child: Image.network(
                        '${ApiService(LocalAuthenticationService()).loadImage()}${actualsEvents[1].photo}',
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
                        actualsEvents[1].name,
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

class CurrentSortPoints extends StatelessWidget {
  const CurrentSortPoints({super.key, required this.nearestSortPoints});

  final nearestSortPoints;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Точки сортировки',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    color: Colors.black12,
                    height: 171,
                    width: 171,
                    child: Image.network(
                      '${ApiService(LocalAuthenticationService()).loadImage()}${nearestSortPoints.first.photo}',
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
                      nearestSortPoints.first.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
              ],
            ),
            SizedBox(width: 15),
            if (nearestSortPoints.length > 1)
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      color: Colors.black12,
                      height: 171,
                      width: 171,
                      child: Image.network(
                        '${ApiService(LocalAuthenticationService()).loadImage()}${nearestSortPoints[1].photo}',
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
                        nearestSortPoints[1].name,
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

class ReportsWidget extends StatefulWidget {
  const ReportsWidget({super.key, required this.reportsOfObject});

  final ReportsOfObject reportsOfObject;
  @override
  State<ReportsWidget> createState() => _ReportsWidgetState();
}

class _ReportsWidgetState extends State<ReportsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Отчеты',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.reportsOfObject.results.length,
          itemBuilder: (BuildContext context, int index) {
            final ReportsOfObjectResult report = widget.reportsOfObject.results[index];

            final String dateOfReport = DateFormat('dd.MM.yyyy').format(report.createdAt);
            final String timeOfReport = DateFormat('hh:mm').format(report.createdAt);
            return SizedBox(
              height: 500,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      '',
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
                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 6,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(ImgsControllerService.defaultImg.url('png'),
                                        width: 24, height: 24)),
                                Text(report.userId.publicName ?? ''),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4.0), child: Text('$dateOfReport в $timeOfReport')),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              report.description,
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Wrap(
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
                                    Text(
                                      report.rates.availability.toString(),
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
                                    Text(
                                      report.rates.beauty.toString(),
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
                                    Text(
                                      report.rates.purity.toString(),
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 0),
        )
      ],
    );
  }
}
