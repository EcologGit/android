import 'package:bloc/bloc.dart';
import 'package:eco/bloc/reports/reports.dart';
import 'package:eco/services/api/api_controller_service.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/data/models/reports.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  ReportsBloc() : super(ReportsState.loading()) {
    on<LoadReports>(_loadReports);
  }
}

Future<void> _loadReports(LoadReports event, Emitter<ReportsState> emit) async {
  try {
    final response =
        await ApiService(LocalAuthenticationService()).get(controller: ApiControllerService.reports);

    if (response.statusCode == 200) {
      print(response.data.runtimeType);

      final Reports data = Reports.fromJson(response.data);
      emit(ReportsState.success(reports: data));
    } else {
      throw Exception();
    }
  } catch (exception, stackTrace) {
    emit(ReportsState.failure(error: exception, stackTrace: stackTrace));
  }
}
