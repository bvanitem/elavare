import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/loginScreen.dart';
import 'screens/registerScreen.dart';
import 'screens/homeScreen.dart';

class Elavare extends StatelessWidget {
  Elavare({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dummy Routing App',
      routerConfig: _router,
    );
  }
}
