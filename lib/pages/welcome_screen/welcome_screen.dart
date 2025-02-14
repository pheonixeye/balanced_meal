import 'package:balanced_meal/assets/assets.dart';
import 'package:balanced_meal/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            AppAssets.welcomeImage,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(flex: 1),
              Text(
                'Balanced Meal',
                style: GoogleFonts.abhayaLibre(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(flex: 6),
              Text(
                'Craft your ideal meal effortlessly with our app. Select nutritious ingredients tailored to your taste and well-being.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Row(
                spacing: 24,
                children: [
                  const SizedBox(),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).goNamed(AppRouter.details);
                      },
                      child: Text('Order Food'),
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
