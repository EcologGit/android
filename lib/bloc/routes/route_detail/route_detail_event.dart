abstract class RouteDetailEvent {
  const RouteDetailEvent._();

  const factory RouteDetailEvent.load({required String routeId}) = LoadDetailOfRoute;
}

final class LoadDetailOfRoute extends RouteDetailEvent {
  final String? routeId;
  const LoadDetailOfRoute({required this.routeId}) : super._();
}
