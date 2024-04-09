import 'package:dio/dio.dart';
import 'package:eco/app_settings.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

///Таймаут
const int timeOut = 150;

/// Класс [Api].
class Api {
  /// Конструктор единственный экземпляр [Api].
  factory Api() => _singleton;
  Api._internal();

  /// Присваиваем dio.
  final Dio dio = createDio();

  static final Api _singleton = Api._internal();

  /// Время ожидание ответа.
  static Duration receiveTimeOut = const Duration(seconds: timeOut);

  /// Время соединения с бэком.
  static Duration connectionTimeOut = const Duration(seconds: timeOut);

  /// Определяем с предустановленными значениями.
  static Dio createDio() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppSettings.serverDomain,
        receiveTimeout: receiveTimeOut,
        connectTimeout: connectionTimeOut,
      ),
    );

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 190,
    ));
    return dio;
  }
}
