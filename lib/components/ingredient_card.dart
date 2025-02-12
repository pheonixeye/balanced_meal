import 'package:balanced_meal/models/ingredient.dart';
import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({
    super.key,
    required this.ingredient,
  });
  final Ingredient ingredient;
  @override
  Widget build(BuildContext context) {
    return Card.outlined(
        //TODO: match design
        );
  }
}
