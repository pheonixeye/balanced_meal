import 'package:balanced_meal/api/ingredients_api/hx_ingredients.dart';
import 'package:balanced_meal/pages/details_screen/details_screen.dart';
import 'package:balanced_meal/pages/order_screen/order_screen.dart';
import 'package:balanced_meal/pages/summary_screen/summary_screen.dart';
import 'package:balanced_meal/pages/welcome_screen/welcome_screen.dart';
import 'package:balanced_meal/providers/px_ingredients.dart';
import 'package:balanced_meal/utils/util_keys.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static const String welcome = '/';
  static const String details = 'details';
  static const String order = 'order';
  static const String summary = 'summary';

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: welcome,
    routes: [
      GoRoute(
        path: welcome,
        name: welcome,
        builder: (context, state) {
          return WelcomeScreen(
            key: state.pageKey,
          );
        },
        routes: [
          GoRoute(
            path: details,
            name: details,
            builder: (context, state) {
              return DetailsScreen(
                key: state.pageKey,
              );
            },
          ),
          GoRoute(
            path: order,
            name: order,
            builder: (context, state) {
              return ChangeNotifierProvider(
                create: (context) => PxIngredients(
                  service: const HxIngredients(),
                ),
                child: OrderScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: summary,
            name: summary,
            builder: (context, state) {
              return SummaryScreen(
                key: state.pageKey,
              );
            },
          ),
        ],
      ),
    ],
  );
}
