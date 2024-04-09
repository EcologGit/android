import 'package:bloc/bloc.dart';
import 'package:eco/bloc/type_and_name_object/type_and_name_object_event.dart';
import 'package:eco/bloc/type_and_name_object/type_and_name_object_state.dart';
import 'package:eco/data/models/events.dart';
import 'package:eco/data/models/places.dart';
import 'package:eco/data/models/routes.dart';
import 'package:eco/data/models/sort_point.dart';
import 'package:eco/services/api/api_controller_service.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

///Дебаунс для того чтобы не было сразу несколько запросов при скролле.
EventTransformer<E> debounce<E>(final Duration duration) {
  return (final Stream<E> events, final dynamic mapper) {
    return events.debounce(duration).switchMap(mapper);
  };
}

class TypeAndNameObjectBloc extends Bloc<TypeAndNameObjectEvent, TypeAndNameObjectState> {
  TypeAndNameObjectBloc() : super(TypeAndNameObjectState.loading()) {
    on<SearchPlace>(
      _searchPlace,
      transformer: debounce(const Duration(milliseconds: 100)),
    );
    on<SearchRoute>(
      _searchRoute,
      transformer: debounce(const Duration(milliseconds: 100)),
    );
    on<SearchEvent>(
      _searchEvent,
      transformer: debounce(const Duration(milliseconds: 100)),
    );
    on<SearchSortPoints>(
      _searchSortPoints,
      transformer: debounce(const Duration(milliseconds: 100)),
    );
    on<CreateReport>(
      _createReport,
    );
  }
}

Future<void> _searchPlace(
  final SearchPlace event,
  final Emitter<TypeAndNameObjectState> emit,
) async {
  try {
    final response = await ApiService(LocalAuthenticationService())
        .getSearch(controller: ApiControllerService.places, search: event.search);

    if (response.statusCode == 200) {
      print(response.data.runtimeType);

      final Places data = Places.fromJson(response.data);
      emit(TypeAndNameObjectState.success(data: data.places));
    } else {
      throw Exception();
    }
  } catch (exception, stackTrace) {
    emit(TypeAndNameObjectState.failure(error: exception, stackTrace: stackTrace));
  }
}

Future<void> _searchRoute(
  final SearchRoute event,
  final Emitter<TypeAndNameObjectState> emit,
) async {
  final response = await ApiService(LocalAuthenticationService())
      .getSearch(controller: ApiControllerService.routes, search: event.search);

  if (response.statusCode == 200) {
    print(response.data.runtimeType);

    final Routes data = Routes.fromJson(response.data);
    emit(TypeAndNameObjectState.success(data: data.routes));
  } else {
    throw Exception();
  }
}

Future<void> _searchEvent(
  final SearchEvent event,
  final Emitter<TypeAndNameObjectState> emit,
) async {
  try {
    final response = await ApiService(LocalAuthenticationService())
        .getSearch(controller: ApiControllerService.events, search: event.search);

    if (response.statusCode == 200) {
      print(response.data.runtimeType);

      final Events data = Events.fromJson(response.data);
      emit(TypeAndNameObjectState.success(data: data.events));
    } else {
      throw Exception();
    }
  } catch (e) {
    rethrow;
  }
}

Future<void> _searchSortPoints(
  final SearchSortPoints event,
  final Emitter<TypeAndNameObjectState> emit,
) async {
  try {
    final response = await ApiService(LocalAuthenticationService())
        .getSearch(controller: ApiControllerService.sortPoints, search: event.search);

    if (response.statusCode == 200) {
      print(response.data.runtimeType);

      final SortPoints data = SortPoints.fromJson(response.data);
      emit(TypeAndNameObjectState.success(data: data.sortPoints));
    } else {
      throw Exception();
    }
  } catch (e) {
    rethrow;
  }
}

Future<void> _createReport(
  final CreateReport event,
  final Emitter<TypeAndNameObjectState> emit,
) async {
  try {
    final response = await ApiService(LocalAuthenticationService())
        .post(controller: ApiControllerService.createReport, createReport: true);

    if (response.statusCode == 200) {
      print(response.data.runtimeType);
      emit(TypeAndNameObjectState.success());
    } else {
      throw Exception();
    }
  } catch (e) {
    rethrow;
  }
}
