import 'dart:async';

import 'package:eco/data/models/tokern.dart';
import 'package:eco/services/api/api_controller_service.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    try {
      final String? refreshToken = await _checkTokenLocally();

      print(refreshToken);
      if (refreshToken == null || refreshToken == '') {
        yield AuthenticationStatus.unauthenticated;
        yield* _controller.stream;
      } else {
        yield AuthenticationStatus.authenticated;
        yield* _controller.stream;
      }
    } catch (e) {
      yield AuthenticationStatus.unauthenticated;
      yield* _controller.stream;
      rethrow;
    }
  }

  Future<String?> _checkTokenLocally() async {
    return LocalAuthenticationService().checkToken();
  }

  Future<void> logIn({
    required String username,
    required String userPassword,
  }) async {
    try {
      final response = await ApiService(LocalAuthenticationService())
          .post(controller: ApiControllerService.userToken, username: username, password: userPassword);

      if (response.statusCode == 200) {
        print(response.data.runtimeType);

        final Token token = Token.fromJson(response.data);

        await _saveToken(token: token);

        _controller.add(AuthenticationStatus.authenticated);
      } else {
        throw Exception();
      }
    } on Exception {
      rethrow;
    }
  }

  Future<void> _saveToken({required final Token token}) async {
    await LocalAuthenticationService().saveToken(token);
  }

  /// Выход из приложения и удаление токена.
  Future<void> logOut() async {
    await LocalAuthenticationService().dropToken();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
