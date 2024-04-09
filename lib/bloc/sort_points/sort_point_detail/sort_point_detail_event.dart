abstract class SortPointDetailEvent {
  const SortPointDetailEvent._();

  const factory SortPointDetailEvent.load({required String sortPointId}) = LoadDetailOfSortPoint;
}

final class LoadDetailOfSortPoint extends SortPointDetailEvent {
  final String? sortPointId;
  const LoadDetailOfSortPoint({required this.sortPointId}) : super._();
}
