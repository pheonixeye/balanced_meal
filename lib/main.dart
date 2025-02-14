import 'package:balanced_meal/firebase_options.dart';
import 'package:balanced_meal/providers/providers.dart';
import 'package:balanced_meal/providers/px_ingredients.dart';
import 'package:balanced_meal/routes/routes.dart';
import 'package:balanced_meal/theme/theme.dart';
import 'package:balanced_meal/utils/util_keys.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ApplicationProvider());
}

class ApplicationProvider extends StatelessWidget {
  const ApplicationProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PxIngredients>(
      builder: (context, i, _) {
        return MaterialApp.router(
          scaffoldMessengerKey: scaffoldKey,
          title: 'Balanced Meal',
          theme: AppTheme.theme,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
