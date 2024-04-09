abstract class EventsEvent {
  const EventsEvent._();

  const factory EventsEvent.load() = LoadEvents;
}

final class LoadEvents extends EventsEvent {
  const LoadEvents() : super._();
}
