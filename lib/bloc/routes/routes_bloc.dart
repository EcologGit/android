import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:eco/data/models/routes.dart';
import 'package:eco/services/api/api_controller_service.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';

import 'routes.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  RoutesBloc() : super(RoutesState.loading()) {
    on<LoadRoutes>(_loadRoutes);
  }
}

Future<void> _loadRoutes(LoadRoutes event, Emitter<RoutesState> emit) async {
  try {
    final Response<dynamic> response =
        await ApiService(LocalAuthenticationService()).get(controller: ApiControllerService.routes);

    if (response.statusCode == 200) {
      print(response.data.runtimeType);

      final Routes data = Routes.fromJson(response.data);
      emit(RoutesState.success(data: data));
    } else {
      throw Exception();
    }
  } catch (exception, stackTrace) {
    emit(RoutesState.failure(error: exception, stackTrace: stackTrace));
  }
}
