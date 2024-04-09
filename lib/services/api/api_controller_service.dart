enum ApiControllerService {
  events,
  places,
  sortPoints,
  routes,
  reports,
  actualEventsEvent,
  actualEventsPlace,
  actualEventsSortPoint,
  actualEventsRoute,
  nearestSortPointsEvent,
  nearestSortPointsPlace,
  nearestSortPointsSortPoint,
  nearestSortPointsRoute,
  reportsOfEvent,
  reportsOfPlace,
  reportsOfSortPoint,
  reportsOfRoute,
  natureObjectsEvent,
  userToken,
  profileInfo,
  reportRoute,
  reportNature,
  reportEvent,
  reportSortPoint,
  createReport,
}

extension ControllerServiceExtension on ApiControllerService {
  String url() => switch (this) {
        ApiControllerService.reportRoute => 'report/routes-search-line',
        ApiControllerService.reportNature => 'report/nature-objects-search-line',
        ApiControllerService.reportEvent => 'report/events-search-line',
        ApiControllerService.reportSortPoint => 'report/sort-points',
        ApiControllerService.events => 'review/events',
        ApiControllerService.places => 'review/places',
        ApiControllerService.sortPoints => 'review/sortPoints',
        ApiControllerService.routes => 'review/routes',
        ApiControllerService.reports => 'activities/reports',
        ApiControllerService.actualEventsEvent => 'review/actual_events/event',
        ApiControllerService.actualEventsPlace => 'review/actual_events/place',
        ApiControllerService.actualEventsSortPoint => 'review/actual_events/sortPoint',
        ApiControllerService.actualEventsRoute => 'review/actual_events/route',
        ApiControllerService.nearestSortPointsEvent => 'review/nearest_sort_points/event',
        ApiControllerService.nearestSortPointsPlace => 'review/nearest_sort_points/place',
        ApiControllerService.nearestSortPointsSortPoint => 'review/nearest_sort_points/sortPoint',
        ApiControllerService.nearestSortPointsRoute => 'review/nearest_sort_points/route',
        ApiControllerService.reportsOfEvent => 'review/reports/event',
        ApiControllerService.reportsOfPlace => 'review/reports/place',
        ApiControllerService.reportsOfSortPoint => 'review/reports/sortPoint',
        ApiControllerService.reportsOfRoute => 'review/reports/route',
        ApiControllerService.natureObjectsEvent => 'review/event_nature_objects',
        ApiControllerService.userToken => 'users/api/mobile_token',
        ApiControllerService.profileInfo => 'user_profiles/profile_info',
        ApiControllerService.createReport => 'report/create_report',
      };
}