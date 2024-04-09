import 'package:eco/data/models/actutal_events.dart';
import 'package:eco/data/models/detail/route_detail.dart';
import 'package:eco/data/models/nearest_sort_points.dart';

abstract class RouteDetailState {
  const RouteDetailState._();

  const factory RouteDetailState.loading() = DetailRouteLoading;

  const factory RouteDetailState.failure({required error, required StackTrace stackTrace}) =
      DetailRouteFailure;

  const factory RouteDetailState.success({
    required RouteDetail route,
    required ActualEvents actualsEvents,
    required NearestSortPoints nearestSortPoints,
  }) = DetailRouteSuccess;
}

final class DetailRouteLoading extends RouteDetailState {
  const DetailRouteLoading() : super._();
}

final class DetailRouteFailure extends RouteDetailState {
  final dynamic error;
  final StackTrace stackTrace;

  const DetailRouteFailure({required this.error, required this.stackTrace}) : super._();
}

final class DetailRouteSuccess extends RouteDetailState {
  final RouteDetail route;
  final ActualEvents actualsEvents;
  final NearestSortPoints nearestSortPoints;

  const DetailRouteSuccess({
    required this.route,
    required this.actualsEvents,
    required this.nearestSortPoints,
  }) : super._();
}
