import 'package:balanced_meal/models/ingredient.dart';
import 'package:balanced_meal/models/order_details_model.dart';
import 'package:balanced_meal/providers/px_ingredients.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PxOrderDetails extends ChangeNotifier {
  static OrderDetailsModel? _orderDetailsModel;
  OrderDetailsModel? get orderDetailsModel => _orderDetailsModel;

  final BuildContext context;

  PxOrderDetails(this.context) {
    _orderDetailsModel ??=
        OrderDetailsModel(model: context.read<PxIngredients>().model!);
  }

  void addIngredient(Ingredient ingredient) {
    _orderDetailsModel?.addIngredient(ingredient);
    notifyListeners();
  }

  void removeIngredient(Ingredient ingredient) {
    _orderDetailsModel?.removeIngredient(ingredient);
    notifyListeners();
  }
}
