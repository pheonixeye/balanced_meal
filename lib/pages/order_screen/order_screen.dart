import 'package:balanced_meal/providers/px_ingredients.dart';
import 'package:balanced_meal/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PxIngredients>(
      builder: (context, i, _) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('order_screen'),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).goNamed(AppRouter.summary);
                  },
                  child: Text('Place Order'),
                ),
                if (i.model == null)
                  Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  ...i.model!.carbs.map((carb) {
                    return ListTile(
                      title: Text(carb.food_name),
                      subtitle: Text(carb.calories.toString()),
                    );
                  })
              ],
            ),
          ),
        );
      },
    );
  }
}
