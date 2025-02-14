// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:balanced_meal/models/ingredient.dart';
import 'package:balanced_meal/models/order_item.dart';
import 'package:equatable/equatable.dart';

import 'package:balanced_meal/models/ingredients_response_model.dart';

class OrderDetailsModel extends Equatable {
  final IngredientsResponseModel model;

  final Map<String, OrderItem> _order = {};

  OrderDetailsModel({required this.model}) {
    model.allIngredients
        .map((e) => _order[e.id!] = OrderItem.initial())
        .toList();
  }

  Map<String, OrderItem> get order => _order;

  void addIngredient(Ingredient ingredient) {
    _order[ingredient.id!] = _order[ingredient.id!]!.copyWith(
      count: _order[ingredient.id!]!.count + 1,
      calories: _order[ingredient.id!]!.calories + ingredient.calories,
      price: _order[ingredient.id!]!.price + ingredient.price,
    );
  }

  void removeIngredient(Ingredient ingredient) {
    if (_order[ingredient.id]!.count == 0) {
      return;
    }
    _order[ingredient.id!] = _order[ingredient.id!]!.copyWith(
      count: _order[ingredient.id!]!.count - 1,
      calories: _order[ingredient.id!]!.calories - ingredient.calories,
      price: _order[ingredient.id!]!.price - ingredient.price,
    );
  }

  bool isIngredientIncluded(Ingredient ingredient) {
    return _order[ingredient.id]?.count != 0;
  }

  int _totalCalories() {
    int _cal = 0;
    _order.entries.map((entry) {
      _cal += entry.value.calories;
    }).toList();
    return _cal;
  }

  int get totalOrderCalories => _totalCalories();

  int _totalPrice() {
    int _price = 0;
    _order.entries.map((entry) {
      _price += entry.value.price;
    }).toList();
    return _price;
  }

  int get totalOrderPrice => _totalPrice();

  bool isorderWithinCalorieRange(int userCalories) {
    int range10 = ((userCalories * 10) / 100).toInt();

    if (totalOrderCalories > userCalories + range10 ||
        totalOrderCalories < userCalories - range10) {
      return false;
    } else {
      return true;
    }
  }

  int ingredientCount(Ingredient ingredient) {
    return _order[ingredient.id]!.count;
  }

  Ingredient ingredientById(String id) {
    return model.allIngredients.firstWhere((ing) => ing.id == id);
  }

  @override
  List<Object> get props => [model, _order];
}
