abstract class RoutesEvent {
  const RoutesEvent._();

  const factory RoutesEvent.load() = LoadRoutes;
}

final class LoadRoutes extends RoutesEvent {
  const LoadRoutes() : super._();
}
