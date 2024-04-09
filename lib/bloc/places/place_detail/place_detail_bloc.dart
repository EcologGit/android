import 'package:bloc/bloc.dart';
import 'package:eco/bloc/places/place_detail/place_detail.dart';
import 'package:eco/data/models/actutal_events.dart';
import 'package:eco/data/models/detail/place_detail.dart';
import 'package:eco/data/models/nearest_sort_points.dart';
import 'package:eco/data/models/reports_of_object.dart';
import 'package:eco/services/api/api_controller_service.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';

class PlaceDetailBloc extends Bloc<PlaceDetailEvent, PlaceDetailState> {
  PlaceDetailBloc() : super(PlaceDetailState.loading()) {
    on<LoadDetailOfPlace>(_loadPlaceDetail);
  }
}

Future<void> _loadPlaceDetail(LoadDetailOfPlace event, Emitter<PlaceDetailState> emit) async {
  try {
    final response = await ApiService(LocalAuthenticationService())
        .get(controller: ApiControllerService.places, body: event.placeId ?? '');

    final ActualEvents actualsEvents = await _loadActualEvent(
        typeOfobject: ApiControllerService.actualEventsPlace, objectId: event.placeId ?? '');

    final NearestSortPoints nearestSortPoints = await _loadNearestSortPoints(
        typeOfobject: ApiControllerService.nearestSortPointsPlace, objectId: event.placeId ?? '');

    final ReportsOfObject reportsOfObject = await _loadReportsOfObject(
        typeOfobject: ApiControllerService.reportsOfPlace, objectId: event.placeId ?? '');

    if (response.statusCode == 200) {
      print(response.data.runtimeType);

      final PlaceDetail data = PlaceDetail.fromJson(response.data);
      emit(PlaceDetailState.success(
        place: data,
        actualsEvents: actualsEvents,
        nearestSortPoints: nearestSortPoints,
        reportsOfObject: reportsOfObject,
      ));
    } else {
      throw Exception();
    }
  } catch (exception, stackTrace) {
    emit(PlaceDetailState.failure(error: exception, stackTrace: stackTrace));
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

Future<ReportsOfObject> _loadReportsOfObject(
    {required ApiControllerService typeOfobject, required String objectId}) async {
  final response =
      await ApiService(LocalAuthenticationService()).get(controller: typeOfobject, body: objectId);

  if (response.statusCode == 200) {
    print(response.data.runtimeType);

    final ReportsOfObject data = ReportsOfObject.fromJson(response.data);
    return data;
  } else {
    throw Exception();
  }
}
