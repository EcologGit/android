import 'package:eco/data/models/routes.dart';

abstract class RoutesState {
  const RoutesState._();

  const factory RoutesState.loading() = RoutesLoading;

  const factory RoutesState.failure({required error, required StackTrace stackTrace}) = RoutesFailure;

  const factory RoutesState.success({required Routes data}) = RoutesSuccess;
}

final class RoutesLoading extends RoutesState {
  const RoutesLoading() : super._();
}

final class RoutesFailure extends RoutesState {
  final dynamic error;
  final StackTrace stackTrace;

  const RoutesFailure({required this.error, required this.stackTrace}) : super._();
}

final class RoutesSuccess extends RoutesState {
  final Routes data;

  const RoutesSuccess({required this.data}) : super._();
}
