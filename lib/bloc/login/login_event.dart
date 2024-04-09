part of 'login_bloc.dart';

sealed class LoginEvent {
  const LoginEvent();
}

final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted({required this.username, required this.userPassword});

  final String username;
  final String userPassword;
}

/// Выйти из аккаунта.
class SignOut extends LoginEvent {
  const SignOut();
}
