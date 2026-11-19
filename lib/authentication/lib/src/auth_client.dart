import 'package:dio/dio.dart';

import 'auth_api.dart';
import 'token_manager.dart';
import 'token_storage.dart';

class AuthClient {
  late final AuthApi api;

  final TokenManager tokenManager;

  AuthClient({required Dio dio, required this.tokenManager}) {
    api = AuthApi(dio: dio, tokenManager: tokenManager);
  }

  Future<bool> get isAuthenticated async {
    return await tokenManager.accessToken != null;
  }

  Future<void> signOut() async {
    try {
      await api.signOut();
    } finally {
      await tokenManager.clear();
    }
  }
}
