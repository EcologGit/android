import 'package:auto_route/auto_route.dart';
import 'package:eco/bloc/events/events.dart';
import 'package:eco/data/models/events.dart';
import 'package:eco/main.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:eco/services/router/router.dart';
import 'package:eco/services/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

@RoutePage()
class EventsReviewPage extends StatelessWidget {
  const EventsReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myRoute = AutoRouter.of(context);

    return BlocProvider(
      create: (context) => EventsBloc()..add(LoadEvents()),
      child: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          if (state is EventsLoading)
            return Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
          if (state is EventsSuccess) {
            final List<Event> events = state.data.events;
            return ListView.separated(
              itemCount: events.length,
              itemBuilder: (BuildContext context, int i) {
                final Event event = events[i];
                final String dateOfEvent = DateFormat('dd.MM.yyyy').format(event.datetimeStart);
                final String timeOfEvent = DateFormat('hh:mm').format(event.datetimeStart);

                final Map<String, Color> choiceColor = {
                  'Активно': ThemeManager.activeColor,
                  'Завершено': ThemeManager.defaultPlaceholderColor,
                  'Отменено': Colors.red,
                  'Запланировано': ThemeManager.activeColor,
                };

                final String srcNetworkImage =
                    '${ApiService(LocalAuthenticationService()).loadImage()}${event.photo}';

                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    GestureDetector(
                      onTap: () {
                        myRoute.push(EventDetailReviewRoute(
                          eventId: event.eventId.toString(),
                        ));
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
                              padding: const EdgeInsets.all(14),
                              decoration:
                                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    event.name,
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
                                        event.adress,
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
                                          color: choiceColor[event.status],
                                        ),
                                      ),
                                      Text(event.status)
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
