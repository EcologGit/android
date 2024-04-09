abstract class EventDetailEvent {
  const EventDetailEvent._();

  const factory EventDetailEvent.load({required String eventId}) = LoadDetailOfEvent;
}

final class LoadDetailOfEvent extends EventDetailEvent {
  final String? eventId;
  const LoadDetailOfEvent({required this.eventId}) : super._();
}
