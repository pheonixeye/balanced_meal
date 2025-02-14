import 'package:balanced_meal/components/order_summary_container.dart';
import 'package:balanced_meal/pages/order_screen/widgets/ingredient_row.dart';

import 'package:balanced_meal/providers/px_ingredients.dart';
import 'package:balanced_meal/providers/px_order_details.dart';
import 'package:balanced_meal/providers/px_user_details.dart';
import 'package:balanced_meal/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<PxIngredients, PxUserDetails, PxOrderDetails>(
      builder: (context, i, d, o, _) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Create Your Order'),
              leading: IconButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(AppRouter.details);
                },
                icon: const Icon(Icons.arrow_left_outlined),
              ),
            ),
            body: ListView(
              children: [
                IngredientRow(
                  title: 'Vegetables',
                  ingredients: i.model?.vegetables,
                ),
                IngredientRow(
                  title: 'Meats',
                  ingredients: i.model?.meat,
                ),
                IngredientRow(
                  title: 'Carbs',
                  ingredients: i.model?.carbs,
                ),
                OrderSummaryContainer(
                  orderCalories: o.orderDetailsModel!.totalOrderCalories,
                  userCalories: d.detailsModel.calories,
                  orderPrice: o.orderDetailsModel!.totalOrderPrice,
                  isOrderWithinCalorieRange: o.orderDetailsModel!
                      .isorderWithinCalorieRange(d.detailsModel.calories),
                  buttonText: 'Place Order',
                  route: AppRouter.summary,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
