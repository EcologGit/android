import 'package:bloc/bloc.dart';
import 'package:eco/bloc/routes/route_detail/route_detail.dart';
import 'package:eco/data/models/actutal_events.dart';
import 'package:eco/data/models/detail/route_detail.dart';
import 'package:eco/data/models/nearest_sort_points.dart';
import 'package:eco/services/api/api_controller_service.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';

class RouteDetailBloc extends Bloc<RouteDetailEvent, RouteDetailState> {
  RouteDetailBloc() : super(RouteDetailState.loading()) {
    on<LoadDetailOfRoute>(_loadRouteDetail);
  }
}

Future<void> _loadRouteDetail(LoadDetailOfRoute event, Emitter<RouteDetailState> emit) async {
  try {
    final response = await ApiService(LocalAuthenticationService())
        .get(controller: ApiControllerService.routes, body: event.routeId ?? '');

    final ActualEvents actualsEvents = await _loadActualEvent(
        typeOfobject: ApiControllerService.actualEventsRoute, objectId: event.routeId ?? '');

    final NearestSortPoints nearestSortPoints = await _loadNearestSortPoints(
        typeOfobject: ApiControllerService.nearestSortPointsRoute, objectId: event.routeId ?? '');

    if (response.statusCode == 200) {
      print(response.data.runtimeType);

      final RouteDetail data = RouteDetail.fromJson(response.data);
      emit(RouteDetailState.success(
        route: data,
        actualsEvents: actualsEvents,
        nearestSortPoints: nearestSortPoints,
      ));
    } else {
      throw Exception();
    }
  } catch (exception, stackTrace) {
    emit(RouteDetailState.failure(error: exception, stackTrace: stackTrace));
  }
}

Future<ActualEvents> _loadActualEvent(
    {required ApiControllerService typeOfobject, required String objectId}) async {
  final response =
      await ApiService(LocalAuthenticationService()).get(controller: typeOfobject, body: objectId);

  if (response.statusCode == 200) {
    print(response.data.runtimeType);

    final ActualEvents data = ActualEvents.fromJson(response.data);
    return data;
  } else {
    throw Exception();
  }
}

Future<NearestSortPoints> _loadNearestSortPoints(
    {required ApiControllerService typeOfobject, required String objectId}) async {
  final response =
      await ApiService(LocalAuthenticationService()).get(controller: typeOfobject, body: objectId);

  if (response.statusCode == 200) {
    print(response.data.runtimeType);

    final NearestSortPoints data = NearestSortPoints.fromJson(response.data);
    return data;
  } else {
    throw Exception();
  }
}
