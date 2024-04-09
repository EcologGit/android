import 'dart:async';
import 'dart:convert';

import 'package:eco/data/models/tokern.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Service [LocalAuthenticationService].
class LocalAuthenticationService {
  final FlutterSecureStorage storages = const FlutterSecureStorage();

  /// Ключ для получения и сохранения refresh_token в storages, живет 30 дней.
  final String refreshTokenKey = 'refresh_token';

  /// Ключ для получения и сохранения access токена в storages, живет 2 дня.
  final String accessTokenKey = 'access_token';

  /// Сохранение токена и ключа для простого входа в приложение и отправки/получения данных с бэка.
  Future<void> saveToken(final Token token) async {
    await _saveForKey(key: refreshTokenKey, value: token.refresh ?? '');
    await _saveForKey(key: accessTokenKey, value: token.access ?? '');
  }

  /// Удаляем jwt токен с устройства
  Future<void> dropToken() async {
    await storages.delete(key: accessTokenKey);
  }

  /// Сохраняем jwt токен на устройстве
  Future<void> _saveForKey({
    required final String key,
    required final String value,
  }) async {
    await storages.write(key: key, value: value);
  }

  /// Получаем данные со storage по нужному ключу.
  Future<String?> readKey({
    required final String key,
  }) async {
    return await storages.read(key: key);
  }

  /// Проверка на наличие токена  и на его корректность при запуске приложения.
  Future<String?> checkToken() async {
    final String? refreshTokenString = await storages.read(key: refreshTokenKey);
    if (refreshTokenString != null) {
      return refreshTokenString;
    } else {
      return null;
    }
  }
}
