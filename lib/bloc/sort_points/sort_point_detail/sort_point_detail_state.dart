import 'package:eco/data/models/detail/sort_point_detail.dart';
import 'package:eco/data/models/nature_objects.dart';

abstract class SortPointDetailState {
  const SortPointDetailState._();

  const factory SortPointDetailState.loading() = DetailSortPointLoading;

  const factory SortPointDetailState.failure({required error, required StackTrace stackTrace}) =
      DetailSortPointFailure;

  const factory SortPointDetailState.success({
    required SortPointDetail sortPoint,
    required NatureObjects natureObjects,
  }) = DetailSortPointSuccess;
}

final class DetailSortPointLoading extends SortPointDetailState {
  const DetailSortPointLoading() : super._();
}

final class DetailSortPointFailure extends SortPointDetailState {
  final dynamic error;
  final StackTrace stackTrace;

  const DetailSortPointFailure({required this.error, required this.stackTrace}) : super._();
}

final class DetailSortPointSuccess extends SortPointDetailState {
  final SortPointDetail sortPoint;
  final NatureObjects natureObjects;

  const DetailSortPointSuccess({
    required this.sortPoint,
    required this.natureObjects,
  }) : super._();
}
