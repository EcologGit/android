import 'package:eco/data/models/reports.dart';

abstract class ReportsState {
  const ReportsState._();

  const factory ReportsState.loading() = ReportsLoading;

  const factory ReportsState.failure({required error, required StackTrace stackTrace}) = ReportsFailure;

  const factory ReportsState.success({required Reports reports}) = ReportsSuccess;
}

final class ReportsLoading extends ReportsState {
  const ReportsLoading() : super._();
}

final class ReportsFailure extends ReportsState {
  final dynamic error;
  final StackTrace stackTrace;

  const ReportsFailure({required this.error, required this.stackTrace}) : super._();
}

final class ReportsSuccess extends ReportsState {
  final Reports reports;

  const ReportsSuccess({required this.reports}) : super._();
}
