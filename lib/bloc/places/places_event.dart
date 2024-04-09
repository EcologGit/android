abstract class PlacesEvent {
  const PlacesEvent._();

  const factory PlacesEvent.load() = LoadPlaces;
}

final class LoadPlaces extends PlacesEvent {
  const LoadPlaces() : super._();
}
