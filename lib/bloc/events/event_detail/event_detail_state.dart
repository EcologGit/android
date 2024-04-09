import 'package:eco/data/models/detail/event_detail.dart';
import 'package:eco/data/models/nature_objects.dart';
import 'package:eco/data/models/nearest_sort_points.dart';

abstract class EventDetailState {
  const EventDetailState._();

  const factory EventDetailState.loading() = DetailEventLoading;

  const factory EventDetailState.failure({required error, required StackTrace stackTrace}) =
      DetailEventFailure;

  const factory EventDetailState.success({
    required EventDetail event,
    required NatureObjects natureObjects,
    required NearestSortPoints nearestSortPoints,
  }) = DetailEventSuccess;
}

final class DetailEventLoading extends EventDetailState {
  const DetailEventLoading() : super._();
}

final class DetailEventFailure extends EventDetailState {
  final dynamic error;
  final StackTrace stackTrace;

  const DetailEventFailure({required this.error, required this.stackTrace}) : super._();
}

final class DetailEventSuccess extends EventDetailState {
  final EventDetail event;
  final NatureObjects natureObjects;
  final NearestSortPoints nearestSortPoints;

  const DetailEventSuccess({
    required this.event,
    required this.natureObjects,
    required this.nearestSortPoints,
  }) : super._();
}
