abstract class TypeAndNameObjectEvent {
  const TypeAndNameObjectEvent._();

  const factory TypeAndNameObjectEvent.searchPlace({required String search}) = SearchPlace;
  const factory TypeAndNameObjectEvent.searchRoute({required String search}) = SearchRoute;
  const factory TypeAndNameObjectEvent.searchEvent({required String search}) = SearchEvent;
  const factory TypeAndNameObjectEvent.searchSortPoints({required String search}) = SearchSortPoints;
  const factory TypeAndNameObjectEvent.createReport() = CreateReport;
}

final class SearchPlace extends TypeAndNameObjectEvent {
  final String search;
  const SearchPlace({required this.search}) : super._();
}

final class SearchRoute extends TypeAndNameObjectEvent {
  final String search;
  const SearchRoute({required this.search}) : super._();
}

final class SearchEvent extends TypeAndNameObjectEvent {
  final String search;
  const SearchEvent({required this.search}) : super._();
}

final class SearchSortPoints extends TypeAndNameObjectEvent {
  final String search;
  const SearchSortPoints({required this.search}) : super._();
}

final class CreateReport extends TypeAndNameObjectEvent {
  const CreateReport() : super._();
}
