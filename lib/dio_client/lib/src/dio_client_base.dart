import 'package:dio/dio.dart';
import 'package:global_config/global_config.dart';

class DioClient {
  static final Dio instance = Dio(
    BaseOptions(
      baseUrl: apiBase,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );
}
