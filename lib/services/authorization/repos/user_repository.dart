import 'dart:async';

import 'package:eco/data/models/user.dart';
import 'package:eco/services/api/api_controller_service.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';

class UserRepository {
  /// Получаем User c бэка.
  Future<User> getUser({required String userId}) async {
    try {
      final response = await ApiService(LocalAuthenticationService())
          .get(controller: ApiControllerService.profileInfo, body: userId);

      return User.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
