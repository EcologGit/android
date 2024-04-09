abstract class TypeAndNameObjectState {
  const TypeAndNameObjectState._();

  const factory TypeAndNameObjectState.loading() = TypeAndNameObjectLoading;

  const factory TypeAndNameObjectState.failure({required error, required StackTrace stackTrace}) =
      TypeAndNameObjectFailure;

  const factory TypeAndNameObjectState.success({dynamic data}) = TypeAndNameObjectSuccess;
}

final class TypeAndNameObjectLoading extends TypeAndNameObjectState {
  const TypeAndNameObjectLoading() : super._();
}

final class TypeAndNameObjectFailure extends TypeAndNameObjectState {
  final dynamic error;
  final StackTrace stackTrace;

  const TypeAndNameObjectFailure({required this.error, required this.stackTrace}) : super._();
}

final class TypeAndNameObjectSuccess extends TypeAndNameObjectState {
  final dynamic data;

  const TypeAndNameObjectSuccess({this.data}) : super._();
}

final class TypeAndNameObjectInitial extends TypeAndNameObjectState {
  const TypeAndNameObjectInitial() : super._();
}
