import 'package:balanced_meal/pages/summary_screen/widgets/order_item_tile.dart';
import 'package:balanced_meal/components/order_summary_container.dart';
import 'package:balanced_meal/providers/px_ingredients.dart';
import 'package:balanced_meal/providers/px_order_details.dart';
import 'package:balanced_meal/providers/px_user_details.dart';
import 'package:balanced_meal/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Order Summary'),
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).goNamed(AppRouter.order);
            },
            icon: const Icon(Icons.arrow_left_outlined),
          ),
        ),
        body: Consumer3<PxIngredients, PxUserDetails, PxOrderDetails>(
          builder: (context, i, d, o, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ...o.orderDetailsModel!.order.entries.map(
                        (orderItem) {
                          if (orderItem.value.count > 0) {
                            return OrderItemTile(orderItem: orderItem);
                          }
                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
                OrderSummaryContainer(
                  orderCalories: o.orderDetailsModel!.totalOrderCalories,
                  userCalories: d.detailsModel.calories,
                  orderPrice: o.orderDetailsModel!.totalOrderPrice,
                  isOrderWithinCalorieRange: o.orderDetailsModel!
                      .isorderWithinCalorieRange(d.detailsModel.calories),
                  buttonText: 'Confirm',
                  route: AppRouter.welcome,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
