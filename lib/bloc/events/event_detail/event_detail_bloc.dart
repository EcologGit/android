import 'package:bloc/bloc.dart';
import 'package:eco/bloc/events/event_detail/event_detail.dart';
import 'package:eco/data/models/detail/event_detail.dart';
import 'package:eco/data/models/nature_objects.dart';
import 'package:eco/data/models/nearest_sort_points.dart';
import 'package:eco/services/api/api_controller_service.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';

class EventDetailBloc extends Bloc<EventDetailEvent, EventDetailState> {
  EventDetailBloc() : super(EventDetailState.loading()) {
    on<LoadDetailOfEvent>(_loadEventDetail);
  }
}

Future<void> _loadEventDetail(LoadDetailOfEvent event, Emitter<EventDetailState> emit) async {
  try {
    final response = await ApiService(LocalAuthenticationService())
        .get(controller: ApiControllerService.events, body: event.eventId ?? '');

    final NatureObjects natureObjects = await _loadNatureObject(
        typeOfobject: ApiControllerService.natureObjectsEvent, objectId: event.eventId ?? '');

    final NearestSortPoints nearestSortPoints = await _loadNearestSortPoints(
        typeOfobject: ApiControllerService.nearestSortPointsPlace, objectId: event.eventId ?? '');

    if (response.statusCode == 200) {
      print(response.data.runtimeType);

      final EventDetail data = EventDetail.fromJson(response.data);
      emit(EventDetailState.success(
        event: data,
        natureObjects: natureObjects,
        nearestSortPoints: nearestSortPoints,
      ));
    } else {
      throw Exception();
    }
  } catch (exception, stackTrace) {
    emit(EventDetailState.failure(error: exception, stackTrace: stackTrace));
  }
}

Future<NatureObjects> _loadNatureObject(
    {required ApiControllerService typeOfobject, required String objectId}) async {
  final response =
      await ApiService(LocalAuthenticationService()).get(controller: typeOfobject, body: objectId);

  if (response.statusCode == 200) {
    print(response.data.runtimeType);

    final NatureObjects data = NatureObjects.fromJson(response.data);
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
