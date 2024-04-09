abstract class SortPointsEvent {
  const SortPointsEvent._();

  const factory SortPointsEvent.load() = LoadSortPoints;
}

final class LoadSortPoints extends SortPointsEvent {
  const LoadSortPoints() : super._();
}
