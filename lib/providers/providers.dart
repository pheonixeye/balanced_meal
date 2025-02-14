import 'package:balanced_meal/api/ingredients_api/hx_ingredients.dart';
import 'package:balanced_meal/providers/px_ingredients.dart';
import 'package:balanced_meal/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider.value(
    value: AppRouter.router.routeInformationProvider,
  ),
  ChangeNotifierProvider(
    create: (context) => PxIngredients(
      service: const HxIngredients(),
    ),
  ),
];
