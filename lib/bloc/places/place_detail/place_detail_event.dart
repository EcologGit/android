abstract class PlaceDetailEvent {
  const PlaceDetailEvent._();

  const factory PlaceDetailEvent.load({required String placeId}) = LoadDetailOfPlace;
}

final class LoadDetailOfPlace extends PlaceDetailEvent {
  final String? placeId;
  const LoadDetailOfPlace({required this.placeId}) : super._();
}
