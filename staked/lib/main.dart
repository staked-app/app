import 'package:authentication/authentication.dart';
import 'package:dio_client/dio_client.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthClient(
      dio: DioClient.instance,
      tokenManager: DioClient.tokenManager,
    );

    return MaterialApp(
      home: FutureBuilder<bool>(
        future: auth.isAuthenticated,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            body: Center(
              child: Text(
                snapshot.data! ? 'Authenticated' : 'Not authenticated',
              ),
            ),
          );
        },
      ),
    );
  }
}
