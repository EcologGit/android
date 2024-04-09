import 'package:bloc/bloc.dart';
import 'package:eco/bloc/places/places.dart';
import 'package:eco/data/models/places.dart';
import 'package:eco/services/api/api_controller_service.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  PlacesBloc() : super(PlacesState.loading()) {
    on<LoadPlaces>(_loadPlaces);
  }
}

Future<void> _loadPlaces(LoadPlaces event, Emitter<PlacesState> emit) async {
  try {
    final response =
        await ApiService(LocalAuthenticationService()).get(controller: ApiControllerService.places);

    if (response.statusCode == 200) {
      print(response.data.runtimeType);

      final Places data = Places.fromJson(response.data);
      emit(PlacesState.success(data: data));
    } else {
      throw Exception();
    }
  } catch (exception, stackTrace) {
    emit(PlacesState.failure(error: exception, stackTrace: stackTrace));
  }
}
