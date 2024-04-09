import 'package:eco/data/models/sort_point.dart';

abstract class SortPointsState {
  const SortPointsState._();

  const factory SortPointsState.loading() = SortPointsLoading;

  const factory SortPointsState.failure({required error, required StackTrace stackTrace}) = SortPointsFailure;

  const factory SortPointsState.success({required SortPoints data}) = SortPointsSuccess;
}

final class SortPointsLoading extends SortPointsState {
  const SortPointsLoading() : super._();
}

final class SortPointsFailure extends SortPointsState {
  final dynamic error;
  final StackTrace stackTrace;

  const SortPointsFailure({required this.error, required this.stackTrace}) : super._();
}

final class SortPointsSuccess extends SortPointsState {
  final SortPoints data;

  const SortPointsSuccess({required this.data}) : super._();
}
