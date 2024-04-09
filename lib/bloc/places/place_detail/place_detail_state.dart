import 'package:eco/data/models/actutal_events.dart';
import 'package:eco/data/models/detail/place_detail.dart';
import 'package:eco/data/models/nearest_sort_points.dart';
import 'package:eco/data/models/reports_of_object.dart';

abstract class PlaceDetailState {
  const PlaceDetailState._();

  const factory PlaceDetailState.loading() = DetailPlaceLoading;

  const factory PlaceDetailState.failure({required error, required StackTrace stackTrace}) =
      DetailPlaceFailure;

  const factory PlaceDetailState.success({
    required PlaceDetail place,
    required ActualEvents actualsEvents,
    required NearestSortPoints nearestSortPoints,
    required ReportsOfObject reportsOfObject,
  }) = DetailPlaceSuccess;
}

final class DetailPlaceLoading extends PlaceDetailState {
  const DetailPlaceLoading() : super._();
}

final class DetailPlaceFailure extends PlaceDetailState {
  final dynamic error;
  final StackTrace stackTrace;

  const DetailPlaceFailure({required this.error, required this.stackTrace}) : super._();
}

final class DetailPlaceSuccess extends PlaceDetailState {
  final PlaceDetail place;
  final ActualEvents actualsEvents;
  final NearestSortPoints nearestSortPoints;
  final ReportsOfObject reportsOfObject;

  const DetailPlaceSuccess(
      {required this.place,
      required this.actualsEvents,
      required this.nearestSortPoints,
      required this.reportsOfObject})
      : super._();
}
