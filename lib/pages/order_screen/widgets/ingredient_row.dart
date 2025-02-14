import 'package:balanced_meal/pages/order_screen/widgets/ingredient_card.dart';
import 'package:balanced_meal/models/ingredient.dart';
import 'package:balanced_meal/theme/theme.dart';
import 'package:flutter/material.dart';

class IngredientRow extends StatelessWidget {
  const IngredientRow({
    super.key,
    required this.title,
    this.ingredients,
  });
  final String title;
  final List<Ingredient>? ingredients;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Text(title),
      ),
      subtitle: ingredients == null
          ? Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    backgroundColor: AppTheme.primaryColor,
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  spacing: 12,
                  children: [
                    ...ingredients!.map((item) {
                      return IngredientCard(ingredient: item);
                    }),
                  ],
                ),
              ),
            ),
    );
  }
}
