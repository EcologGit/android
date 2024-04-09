import 'package:bloc/bloc.dart';
import 'package:eco/data/models/events.dart';
import 'package:eco/services/api/api_controller_service.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';

import 'events.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc() : super(EventsState.loading()) {
    on<LoadEvents>(_loadEvents);
  }
}

Future<void> _loadEvents(LoadEvents event, Emitter<EventsState> emit) async {
  try {
    final response =
        await ApiService(LocalAuthenticationService()).get(controller: ApiControllerService.events);

    if (response.statusCode == 200) {
      print(response.data.runtimeType);

      final Events data = Events.fromJson(response.data);
      emit(EventsState.success(data: data));
    } else {
      throw Exception();
    }
  } catch (exception, stackTrace) {
    emit(EventsState.failure(error: exception, stackTrace: stackTrace));
  }
}
