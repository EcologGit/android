abstract class ReportsEvent {
  const ReportsEvent._();

  const factory ReportsEvent.load() = LoadReports;
}

final class LoadReports extends ReportsEvent {
  const LoadReports() : super._();
}
