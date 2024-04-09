import 'package:eco/data/models/events.dart';

abstract class EventsState {
  const EventsState._();

  const factory EventsState.loading() = EventsLoading;

  const factory EventsState.failure({required error, required StackTrace stackTrace}) = EventsFailure;

  const factory EventsState.success({required Events data}) = EventsSuccess;
}

final class EventsLoading extends EventsState {
  const EventsLoading() : super._();
}

final class EventsFailure extends EventsState {
  final dynamic error;
  final StackTrace stackTrace;

  const EventsFailure({required this.error, required this.stackTrace}) : super._();
}

final class EventsSuccess extends EventsState {
  final Events data;

  const EventsSuccess({required this.data}) : super._();
}
