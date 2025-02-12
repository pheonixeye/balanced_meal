import 'package:balanced_meal/api/ingredients_api/hx_ingredients.dart';
import 'package:balanced_meal/models/ingredients_response_model.dart';
import 'package:flutter/material.dart';

class PxIngredients extends ChangeNotifier {
  final HxIngredients service;

  PxIngredients({required this.service}) {
    _fetchIngredients();
  }

  static IngredientsResponseModel? _model;
  IngredientsResponseModel? get model => _model;

  Future<void> _fetchIngredients() async {
    _model = await service.fetchIngredientsFromDb();
    notifyListeners();
  }
}
