import 'package:elavare/screens/landing_screen.dart';
import 'package:elavare/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/loginScreen.dart';
import 'screens/registerScreen.dart';
import 'screens/homeScreen.dart';

class Elavare extends StatelessWidget {
  Elavare({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/landing',
    routes: [
      GoRoute(
        path: '/landing',
        builder: (context, state) => const LandingScreen(viewModel: AuthViewModel()),
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
      title: 'Elavare ',
      routerConfig: _router,
    );
  }
}
