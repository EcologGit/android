import 'package:bloc/bloc.dart';
import 'package:eco/bloc/sort_points/sort_point_detail/sort_point_detail.dart';
import 'package:eco/data/models/detail/sort_point_detail.dart';
import 'package:eco/data/models/nature_objects.dart';
import 'package:eco/services/api/api_controller_service.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';

class SortPointDetailBloc extends Bloc<SortPointDetailEvent, SortPointDetailState> {
  SortPointDetailBloc() : super(SortPointDetailState.loading()) {
    on<LoadDetailOfSortPoint>(_loadSortPointDetail);
  }
}

Future<void> _loadSortPointDetail(LoadDetailOfSortPoint event, Emitter<SortPointDetailState> emit) async {
  try {
    final response = await ApiService(LocalAuthenticationService())
        .get(controller: ApiControllerService.sortPoints, body: event.sortPointId ?? '');

    final NatureObjects natureObjects = await _loadNatureObject(
        typeOfobject: ApiControllerService.natureObjectsEvent, objectId: event.sortPointId ?? '');

    if (response.statusCode == 200) {
      print(response.data.runtimeType);

      final SortPointDetail data = SortPointDetail.fromJson(response.data);
      emit(SortPointDetailState.success(
        sortPoint: data,
        natureObjects: natureObjects,
      ));
    } else {
      throw Exception();
    }
  } catch (exception, stackTrace) {
    emit(SortPointDetailState.failure(error: exception, stackTrace: stackTrace));
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
