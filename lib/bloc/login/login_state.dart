part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failing }

abstract class LoginState {
  const LoginState._();

  const factory LoginState.initial() = LoginInitial;

  const factory LoginState.loading() = LoginLoading;

  const factory LoginState.failure(error, StackTrace stackTrace) = LoginFailure;

  const factory LoginState.success() = LoginSuccess;
}

final class LoginInitial extends LoginState {
  const LoginInitial() : super._();
}

final class LoginLoading extends LoginState {
  const LoginLoading() : super._();
}

final class LoginFailure extends LoginState {
  final dynamic error;
  final StackTrace stackTrace;

  const LoginFailure(this.error, this.stackTrace) : super._();
}

final class LoginSuccess extends LoginState {
  const LoginSuccess() : super._();
}
