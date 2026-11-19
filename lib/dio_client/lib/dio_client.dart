import 'package:authentication/authentication.dart';
import 'package:dio/dio.dart';
import 'package:global_config/global_config.dart';

class DioClient {
  static final TokenManager tokenManager = TokenManager(
    baseUrl: apiBase,
    storage: TokenStorage(),
  );

  static final Dio instance = _create();

  static Dio _create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: apiBase,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json', 'st-auth-mode': 'header'},
      ),
    );

    dio.interceptors.add(AuthInterceptor(dio: dio, tokenManager: tokenManager));

    return dio;
  }
}
