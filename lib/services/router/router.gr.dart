// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ActivityRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ActivityScreen(),
      );
    },
    EventDetailReviewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EventDetailReviewRouteArgs>(
          orElse: () =>
              EventDetailReviewRouteArgs(eventId: pathParams.optString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EventDetailReviewPage(
          eventId: args.eventId,
          key: args.key,
        ),
      );
    },
    EventsMarksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EventsMarksPage(),
      );
    },
    EventsReviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EventsReviewPage(),
      );
    },
    LogInProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LogInProfilePage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    MarksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MarksScreen(),
      );
    },
    NewReportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewReportScreen(),
      );
    },
    PlaceDetailReviewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PlaceDetailReviewRouteArgs>(
          orElse: () =>
              PlaceDetailReviewRouteArgs(placeId: pathParams.optString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlaceDetailReviewPage(
          placeId: args.placeId,
          key: args.key,
        ),
      );
    },
    PlacesMarksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlacesMarksPage(),
      );
    },
    PlacesReviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlacesReviewPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    ReportsActivityRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReportsActivityPage(),
      );
    },
    ReportsUserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReportsUserPage(),
      );
    },
    ReviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReviewScreen(),
      );
    },
    RouteDetailReviewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RouteDetailReviewRouteArgs>(
          orElse: () =>
              RouteDetailReviewRouteArgs(routeId: pathParams.optString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RouteDetailReviewPage(
          routeId: args.routeId,
          key: args.key,
        ),
      );
    },
    RoutesMarksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RoutesMarksPage(),
      );
    },
    RoutesReviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RoutesReviewPage(),
      );
    },
    SelectionSortPointsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectionSortPointsScreen(),
      );
    },
    SettingsUserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsUserPage(),
      );
    },
    SignInProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInProfilePage(),
      );
    },
    SortPointDetailReviewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SortPointDetailReviewRouteArgs>(
          orElse: () => SortPointDetailReviewRouteArgs(
              sortPointId: pathParams.optString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SortPointDetailReviewPage(
          sortPointId: args.sortPointId,
          key: args.key,
        ),
      );
    },
    SortPointsMarksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SortPointsMarksPage(),
      );
    },
    SortPointsReviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SortPointsReviewPage(),
      );
    },
    StatisticsUserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StatisticsUserPage(),
      );
    },
    TopActivityRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TopActivityPage(),
      );
    },
    TypeAndNameObjectRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TypeAndNameObjectScreen(),
      );
    },
    UserProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserProfilePage(),
      );
    },
  };
}

/// generated route for
/// [ActivityScreen]
class ActivityRoute extends PageRouteInfo<void> {
  const ActivityRoute({List<PageRouteInfo>? children})
      : super(
          ActivityRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivityRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EventDetailReviewPage]
class EventDetailReviewRoute extends PageRouteInfo<EventDetailReviewRouteArgs> {
  EventDetailReviewRoute({
    String? eventId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EventDetailReviewRoute.name,
          args: EventDetailReviewRouteArgs(
            eventId: eventId,
            key: key,
          ),
          rawPathParams: {'id': eventId},
          initialChildren: children,
        );

  static const String name = 'EventDetailReviewRoute';

  static const PageInfo<EventDetailReviewRouteArgs> page =
      PageInfo<EventDetailReviewRouteArgs>(name);
}

class EventDetailReviewRouteArgs {
  const EventDetailReviewRouteArgs({
    this.eventId,
    this.key,
  });

  final String? eventId;

  final Key? key;

  @override
  String toString() {
    return 'EventDetailReviewRouteArgs{eventId: $eventId, key: $key}';
  }
}

/// generated route for
/// [EventsMarksPage]
class EventsMarksRoute extends PageRouteInfo<void> {
  const EventsMarksRoute({List<PageRouteInfo>? children})
      : super(
          EventsMarksRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventsMarksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EventsReviewPage]
class EventsReviewRoute extends PageRouteInfo<void> {
  const EventsReviewRoute({List<PageRouteInfo>? children})
      : super(
          EventsReviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventsReviewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LogInProfilePage]
class LogInProfileRoute extends PageRouteInfo<void> {
  const LogInProfileRoute({List<PageRouteInfo>? children})
      : super(
          LogInProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MarksScreen]
class MarksRoute extends PageRouteInfo<void> {
  const MarksRoute({List<PageRouteInfo>? children})
      : super(
          MarksRoute.name,
          initialChildren: children,
        );

  static const String name = 'MarksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewReportScreen]
class NewReportRoute extends PageRouteInfo<void> {
  const NewReportRoute({List<PageRouteInfo>? children})
      : super(
          NewReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewReportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlaceDetailReviewPage]
class PlaceDetailReviewRoute extends PageRouteInfo<PlaceDetailReviewRouteArgs> {
  PlaceDetailReviewRoute({
    String? placeId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PlaceDetailReviewRoute.name,
          args: PlaceDetailReviewRouteArgs(
            placeId: placeId,
            key: key,
          ),
          rawPathParams: {'id': placeId},
          initialChildren: children,
        );

  static const String name = 'PlaceDetailReviewRoute';

  static const PageInfo<PlaceDetailReviewRouteArgs> page =
      PageInfo<PlaceDetailReviewRouteArgs>(name);
}

class PlaceDetailReviewRouteArgs {
  const PlaceDetailReviewRouteArgs({
    this.placeId,
    this.key,
  });

  final String? placeId;

  final Key? key;

  @override
  String toString() {
    return 'PlaceDetailReviewRouteArgs{placeId: $placeId, key: $key}';
  }
}

/// generated route for
/// [PlacesMarksPage]
class PlacesMarksRoute extends PageRouteInfo<void> {
  const PlacesMarksRoute({List<PageRouteInfo>? children})
      : super(
          PlacesMarksRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlacesMarksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlacesReviewPage]
class PlacesReviewRoute extends PageRouteInfo<void> {
  const PlacesReviewRoute({List<PageRouteInfo>? children})
      : super(
          PlacesReviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlacesReviewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReportsActivityPage]
class ReportsActivityRoute extends PageRouteInfo<void> {
  const ReportsActivityRoute({List<PageRouteInfo>? children})
      : super(
          ReportsActivityRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportsActivityRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReportsUserPage]
class ReportsUserRoute extends PageRouteInfo<void> {
  const ReportsUserRoute({List<PageRouteInfo>? children})
      : super(
          ReportsUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportsUserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReviewScreen]
class ReviewRoute extends PageRouteInfo<void> {
  const ReviewRoute({List<PageRouteInfo>? children})
      : super(
          ReviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReviewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RouteDetailReviewPage]
class RouteDetailReviewRoute extends PageRouteInfo<RouteDetailReviewRouteArgs> {
  RouteDetailReviewRoute({
    String? routeId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RouteDetailReviewRoute.name,
          args: RouteDetailReviewRouteArgs(
            routeId: routeId,
            key: key,
          ),
          rawPathParams: {'id': routeId},
          initialChildren: children,
        );

  static const String name = 'RouteDetailReviewRoute';

  static const PageInfo<RouteDetailReviewRouteArgs> page =
      PageInfo<RouteDetailReviewRouteArgs>(name);
}

class RouteDetailReviewRouteArgs {
  const RouteDetailReviewRouteArgs({
    this.routeId,
    this.key,
  });

  final String? routeId;

  final Key? key;

  @override
  String toString() {
    return 'RouteDetailReviewRouteArgs{routeId: $routeId, key: $key}';
  }
}

/// generated route for
/// [RoutesMarksPage]
class RoutesMarksRoute extends PageRouteInfo<void> {
  const RoutesMarksRoute({List<PageRouteInfo>? children})
      : super(
          RoutesMarksRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoutesMarksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RoutesReviewPage]
class RoutesReviewRoute extends PageRouteInfo<void> {
  const RoutesReviewRoute({List<PageRouteInfo>? children})
      : super(
          RoutesReviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoutesReviewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectionSortPointsScreen]
class SelectionSortPointsRoute extends PageRouteInfo<void> {
  const SelectionSortPointsRoute({List<PageRouteInfo>? children})
      : super(
          SelectionSortPointsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectionSortPointsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsUserPage]
class SettingsUserRoute extends PageRouteInfo<void> {
  const SettingsUserRoute({List<PageRouteInfo>? children})
      : super(
          SettingsUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsUserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInProfilePage]
class SignInProfileRoute extends PageRouteInfo<void> {
  const SignInProfileRoute({List<PageRouteInfo>? children})
      : super(
          SignInProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SortPointDetailReviewPage]
class SortPointDetailReviewRoute
    extends PageRouteInfo<SortPointDetailReviewRouteArgs> {
  SortPointDetailReviewRoute({
    String? sortPointId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SortPointDetailReviewRoute.name,
          args: SortPointDetailReviewRouteArgs(
            sortPointId: sortPointId,
            key: key,
          ),
          rawPathParams: {'id': sortPointId},
          initialChildren: children,
        );

  static const String name = 'SortPointDetailReviewRoute';

  static const PageInfo<SortPointDetailReviewRouteArgs> page =
      PageInfo<SortPointDetailReviewRouteArgs>(name);
}

class SortPointDetailReviewRouteArgs {
  const SortPointDetailReviewRouteArgs({
    this.sortPointId,
    this.key,
  });

  final String? sortPointId;

  final Key? key;

  @override
  String toString() {
    return 'SortPointDetailReviewRouteArgs{sortPointId: $sortPointId, key: $key}';
  }
}

/// generated route for
/// [SortPointsMarksPage]
class SortPointsMarksRoute extends PageRouteInfo<void> {
  const SortPointsMarksRoute({List<PageRouteInfo>? children})
      : super(
          SortPointsMarksRoute.name,
          initialChildren: children,
        );

  static const String name = 'SortPointsMarksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SortPointsReviewPage]
class SortPointsReviewRoute extends PageRouteInfo<void> {
  const SortPointsReviewRoute({List<PageRouteInfo>? children})
      : super(
          SortPointsReviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SortPointsReviewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StatisticsUserPage]
class StatisticsUserRoute extends PageRouteInfo<void> {
  const StatisticsUserRoute({List<PageRouteInfo>? children})
      : super(
          StatisticsUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatisticsUserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TopActivityPage]
class TopActivityRoute extends PageRouteInfo<void> {
  const TopActivityRoute({List<PageRouteInfo>? children})
      : super(
          TopActivityRoute.name,
          initialChildren: children,
        );

  static const String name = 'TopActivityRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TypeAndNameObjectScreen]
class TypeAndNameObjectRoute extends PageRouteInfo<void> {
  const TypeAndNameObjectRoute({List<PageRouteInfo>? children})
      : super(
          TypeAndNameObjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'TypeAndNameObjectRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserProfilePage]
class UserProfileRoute extends PageRouteInfo<void> {
  const UserProfileRoute({List<PageRouteInfo>? children})
      : super(
          UserProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
