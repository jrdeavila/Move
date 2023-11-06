import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_app/src/presentation/pages/authentication/login.dart';
import 'package:move_app/src/presentation/pages/authentication/register.dart';
import 'package:move_app/src/presentation/pages/main.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/principal': (context) => const Main(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
      },
      home: const Main(),
    );
  }
}
