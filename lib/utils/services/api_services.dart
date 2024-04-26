// Api Services
import 'package:dio/dio.dart';
import 'package:venturo_core/constants/api_const.dart';

class ApiServices {
  /// Ensures that this class cannot be instantiated
  ApiServices._();

  /// Get the dio object based on its timeout and token
  static Dio dioCall(
      {int timeout = 20000, String? token, String? authorization}) {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['token'] = token;
    }

    if (authorization != null) {
      headers['Authorization'] = authorization;
    }

    var dio = Dio(
      BaseOptions(
        headers: headers,
        baseUrl: ApiConst.baseUrl,
        connectTimeout: Duration(milliseconds: timeout),
      ),
    );

    return dio;
  }
}
