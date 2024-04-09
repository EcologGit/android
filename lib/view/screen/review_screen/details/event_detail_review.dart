import 'package:auto_route/auto_route.dart';
import 'package:eco/bloc/events/event_detail/event_detail.dart';
import 'package:eco/data/models/detail/event_detail.dart';
import 'package:eco/main.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:eco/services/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

@RoutePage()
class EventDetailReviewPage extends StatelessWidget {
  const EventDetailReviewPage({@PathParam('id') this.eventId, super.key});

  final String? eventId;

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> choiceColor = {
      'Активно': ThemeManager.activeColor,
      'Завершено': ThemeManager.defaultPlaceholderColor,
      'Отменено': Colors.red,
      'Запланировано': ThemeManager.activeColor,
    };
    return BlocProvider(
      key: UniqueKey(),
      create: (context) => EventDetailBloc()..add(LoadDetailOfEvent(eventId: eventId)),
      child: BlocBuilder<EventDetailBloc, EventDetailState>(
        builder: (context, state) {
          if (state is DetailEventLoading)
            return Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
          else if (state is DetailEventSuccess) {
            final EventDetail event = state.event;
            final String srcNetworkImage =
                '${ApiService(LocalAuthenticationService()).loadImage()}${event.photo}';
            final String dateOfEvent =
                DateFormat('dd.MM.yyyy').format(state.event.timeStart ?? DateTime.now());
            final String timeOfEvent = DateFormat('hh:mm').format(state.event.timeStart ?? DateTime.now());
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Мероприятия',
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
                              state.event.name ?? '',
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
                                Text(state.event.natureObjects.first.locality ?? ''),
                              ],
                            ),
                            Wrap(
                              spacing: 3,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.route,
                                  size: 12,
                                ),
                                Text(state.event.adress ?? ''),
                              ],
                            ),
                            Wrap(
                              spacing: 3,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.flag,
                                  size: 12,
                                ),
                                Text(state.event.natureObjects.first.name ?? ''),
                              ],
                            ),
                            Wrap(
                              spacing: 10,
                              children: [
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 3,
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      size: 15,
                                    ),
                                    Text(
                                      dateOfEvent,
                                      style: TextStyle(
                                        fontSize: 14,
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
                                      timeOfEvent,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 6,
                              children: [
                                Container(
                                  height: 12,
                                  width: 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: choiceColor[state.event.statusId.name],
                                  ),
                                ),
                                Text(state.event.statusId.name ?? '')
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
                              state.event.description ?? '',
                            ),
                            RatingWidget(),
                            const WasteWidget(),
                            if (state.natureObjects.results.isNotEmpty) ...[
                              CurrentObjects(
                                natureObjects: state.natureObjects.results,
                              ),
                            ],
                            if (state.nearestSortPoints.results.isNotEmpty) ...[
                              CurrentSortPoints(
                                nearestSortPoints: state.nearestSortPoints.results,
                              ),
                            ],
                            if (false) ...[
                              ReportsWidget(),
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

class RatingWidget extends StatelessWidget {
  const RatingWidget({
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
                const Text(
                  '0',
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
                const Text(
                  '0',
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
                const Text(
                  '0',
                  style: TextStyle(
                    fontSize: 17,
                  ),
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
          'Объекты',
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
  const ReportsWidget({super.key});

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
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 500,
              child: Stack(
                alignment: Alignment.topRight,
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
                                const Text('Username'),
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(4.0), child: Text('01.01.2000 в 00:00')),
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet consectetur. Dignissim sed et duis fermentum id. At volutpat nulla quis eget. Morbi turpis pulvinar in auctor in turpis. Erat facilisis quam tempus varius venenatis volutpat urna massa. Feugiat egestas nibh tellus lectus. Non nam nibh vitae et et. Ac amet lacus ullamcorper in volutpat. In habitant sit mauris ullamcorper neque dui. Non leo pellentesque ultricies donec. Erat in faucibus aliquam pellentesque molestie semper sit enim.',
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
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15),
        )
      ],
    );
  }
}
