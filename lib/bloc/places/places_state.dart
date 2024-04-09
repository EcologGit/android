import 'package:eco/data/models/places.dart';

abstract class PlacesState {
  const PlacesState._();

  const factory PlacesState.loading() = PlacesLoading;

  const factory PlacesState.failure({required error, required StackTrace stackTrace}) = PlacesFailure;

  const factory PlacesState.success({required Places data}) = PlacesSuccess;
}

final class PlacesLoading extends PlacesState {
  const PlacesLoading() : super._();
}

final class PlacesFailure extends PlacesState {
  final dynamic error;
  final StackTrace stackTrace;

  const PlacesFailure({required this.error, required this.stackTrace}) : super._();
}

final class PlacesSuccess extends PlacesState {
  final Places data;

  const PlacesSuccess({required this.data}) : super._();
}
