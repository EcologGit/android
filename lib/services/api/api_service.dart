import 'dart:async';

import 'package:dio/dio.dart';
import 'package:eco/app_settings.dart';
import 'package:eco/services/api/api_controller_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  ApiService(this.localAuthenticationService);
  static const subController = '/django_api/';
  static const timeout = 20;

  final dio = Dio();

  /// Создаем класс [LocalAuthenticationService].
  final LocalAuthenticationService localAuthenticationService;

  Future<Response<dynamic>> get({required ApiControllerService controller, String body = ''}) async {
    String? accessTokenKey =
        await localAuthenticationService.readKey(key: localAuthenticationService.accessTokenKey);
    dio
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 190,
      ));
    final String data = '$subController${controller.url()}';
    final Uri url = Uri.http(AppSettings.serverDomain, '$data/$body');
    print(accessTokenKey);
    final response = await dio.get(
      url.toString(),
      options: Options(headers: {'Authorization': 'Bearer $accessTokenKey'}),
    );

    return response;
  }

  Future<Response<dynamic>> getSearch(
      {required ApiControllerService controller, String body = '', String search = ''}) async {
    String? accessTokenKey =
        await localAuthenticationService.readKey(key: localAuthenticationService.accessTokenKey);
    dio
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 190,
      ));
    final String data = '$subController${controller.url()}';
    final Uri url = Uri.http(AppSettings.serverDomain, '$data/$body');
    print(accessTokenKey);
    final response = await dio.get(
      url.toString(),
      queryParameters: {'search': search},
      options: Options(headers: {'Authorization': 'Bearer $accessTokenKey'}),
    );

    return response;
  }

  Future<Response<dynamic>> post(
      {required ApiControllerService controller,
      String? username,
      String? password,
      bool createReport = false}) async {
    dio
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 190,
      ));
    final data = '$subController${controller.url()}';
    var dataMap = {'username': username, 'password': password};
    if (createReport) {
      String? accessTokenKey =
          await localAuthenticationService.readKey(key: localAuthenticationService.accessTokenKey);
      var dataMap = FormData.fromMap({
        'description': 'Все было супер. Сливкин Е.Д.',
        // 'description': 'Норм',
        'rate': '{  \n  "availability": 5,\n  "beauty": 5,\n  "purity": 5\n}',
        'results': '[{ \n  "waste_id": 1,\n  "amount": 10\n}]\n',
        'report_status': 'Черновик',
        'point_id': '1',
        'type_obj': 'route',
        'id_obj': '1'
      });
      final response = await dio.request(
        'http://81.163.30.36/django_api/report/create_report/',
        options: Options(
          method: 'POST',
          headers: {'Authorization': 'Bearer $accessTokenKey'},
        ),
        data: dataMap,
      );
      return response;
    }
    final url = Uri.https(AppSettings.serverDomain, data);

    ///TODO: не проходила авторизация по uri, вставил замоканную, норм работает
    final response = await dio.post(
      'http://81.163.30.36/django_api/users/api/mobile_token/',
      data: dataMap,
    );

    return response;
  }

  //   Future<Response<dynamic>> post(
  //     {required ApiControllerService controller, String? username, String? password}) async {
  //   final data = '$subController${controller.url()}';

  //   final response = await Api().dio.post(
  //     data,
  //     data: <String, String>{
  //       'username': username ?? '',
  //       'password': password ?? '',
  //     },
  //   );

  //   return response;
  // }

  String loadImage() {
    String subController = '/django_api';

    final String urlString = Uri.http(AppSettings.serverDomain, subController).toString();

    return urlString;
  }
}
