import 'package:balanced_meal/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('welcome_screen'),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).goNamed(AppRouter.details);
              },
              child: Text('Order Food'),
            ),
          ],
        ),
      ),
    );
  }
}
