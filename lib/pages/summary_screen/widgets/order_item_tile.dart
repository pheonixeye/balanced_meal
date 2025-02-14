import 'package:balanced_meal/components/small_rounded_button.dart';
import 'package:balanced_meal/models/order_item.dart';
import 'package:balanced_meal/providers/px_order_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderItemTile extends StatelessWidget {
  const OrderItemTile({
    super.key,
    required this.orderItem,
  });
  final MapEntry<String, OrderItem> orderItem;
  @override
  Widget build(BuildContext context) {
    return Consumer<PxOrderDetails>(
      builder: (context, o, _) {
        final ingredient = o.orderDetailsModel?.ingredientById(orderItem.key);
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4,
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 1,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 8,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: ingredient?.image_url ?? '',
                        fit: BoxFit.cover,
                        height: 62,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                ingredient?.food_name ?? '',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                r'$' '${ingredient?.price ?? ''}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '${ingredient?.calories ?? ''} Cal',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff959595),
                                ),
                              ),
                              const Spacer(),
                              SmallRoundedButton(
                                onTap: () {
                                  o.removeIngredient(ingredient!);
                                },
                                iconData: Icons.remove,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 10,
                                ),
                                child: Text(
                                  o.orderDetailsModel
                                          ?.ingredientCount(ingredient!)
                                          .toString() ??
                                      '',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SmallRoundedButton(
                                onTap: () {
                                  o.addIngredient(ingredient!);
                                },
                                iconData: Icons.add,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
