import 'package:bloc/bloc.dart';
import 'package:eco/data/models/sort_point.dart';
import 'package:eco/services/api/api_controller_service.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';

import 'sort_points.dart';

class SortPointsBloc extends Bloc<SortPointsEvent, SortPointsState> {
  SortPointsBloc() : super(SortPointsState.loading()) {
    on<LoadSortPoints>(_loadSortPoints);
  }
}

Future<void> _loadSortPoints(LoadSortPoints event, Emitter<SortPointsState> emit) async {
  try {
    final response =
        await ApiService(LocalAuthenticationService()).get(controller: ApiControllerService.sortPoints);

    if (response.statusCode == 200) {
      print(response.data.runtimeType);

      final SortPoints data = SortPoints.fromJson(response.data);
      emit(SortPointsState.success(data: data));
    } else {
      throw Exception();
    }
  } catch (exception, stackTrace) {
    emit(SortPointsState.failure(error: exception, stackTrace: stackTrace));
  }
}
