import 'package:balanced_meal/components/small_rounded_button.dart';
import 'package:balanced_meal/models/ingredient.dart';
import 'package:balanced_meal/providers/px_order_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({
    super.key,
    required this.ingredient,
  });
  final Ingredient ingredient;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 183,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xff898989),
            blurRadius: 2,
            spreadRadius: 0,
            offset: Offset(3, 4),
          ),
        ],
      ),
      child: Consumer<PxOrderDetails>(
        builder: (context, o, _) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 163,
                  height: 108,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xffEAECF0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: ingredient.image_url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        ingredient.food_name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '${ingredient.calories} Cal',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff959595),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Text(r'$' '${ingredient.price}'),
                    if (!o.orderDetailsModel!
                        .isIngredientIncluded(ingredient)) ...[
                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 2,
                          ),
                        ),
                        onPressed: () {
                          o.addIngredient(ingredient);
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ] else ...[
                      const Spacer(),
                      SmallRoundedButton(
                        onTap: () {
                          o.removeIngredient(ingredient);
                        },
                        iconData: Icons.remove,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 10,
                        ),
                        child: Text(o.orderDetailsModel
                                ?.ingredientCount(ingredient)
                                .toString() ??
                            ''),
                      ),
                      SmallRoundedButton(
                        onTap: () {
                          o.addIngredient(ingredient);
                        },
                        iconData: Icons.add,
                      ),
                    ]
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
