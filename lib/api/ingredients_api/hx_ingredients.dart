import 'dart:math';

import 'package:balanced_meal/api/common.dart';
import 'package:balanced_meal/models/ingredient.dart';
import 'package:balanced_meal/models/ingredients_response_model.dart';

class HxIngredients {
  const HxIngredients();

  static const String _carb = 'Carb';
  static const String _meat = 'Meat';
  static const String _vegetable = 'Vegetable';

  Future<IngredientsResponseModel> fetchIngredientsFromDb() async {
    final _carbResult = await HxCommon.db.collection(_carb).get();
    final _meatResult = await HxCommon.db.collection(_meat).get();
    final _vegetableResult = await HxCommon.db.collection(_vegetable).get();

    final carbs = _carbResult.docs
        .map((e) => Ingredient.fromJson(
              e.id,
              e.data(),
              Random.secure().nextInt(10) + 10,
            ))
        .toList();
    final meat = _meatResult.docs
        .map((e) => Ingredient.fromJson(
              e.id,
              e.data(),
              Random.secure().nextInt(30) + 10,
            ))
        .toList();
    final vegetables = _vegetableResult.docs
        .map((e) => Ingredient.fromJson(
              e.id,
              e.data(),
              Random.secure().nextInt(5) + 10,
            ))
        .toList();

    return IngredientsResponseModel(
      carbs: carbs,
      vegetables: vegetables,
      meat: meat,
    );
  }
}
