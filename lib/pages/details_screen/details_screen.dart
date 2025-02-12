import 'package:balanced_meal/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('details_screen'),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).goNamed(AppRouter.order);
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
