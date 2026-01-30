import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Register Screen'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('Register -> Home'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => context.go('/landing'),
              child: const Text('Back to Landing'),
            ),
          ],
        ),
      ),
    );
  }
}
