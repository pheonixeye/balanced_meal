// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:balanced_meal/models/ingredient.dart';

class IngredientsResponseModel extends Equatable {
  final List<Ingredient> carbs;
  final List<Ingredient> vegetables;
  final List<Ingredient> meat;

  const IngredientsResponseModel({
    required this.carbs,
    required this.vegetables,
    required this.meat,
  });
  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [
        carbs,
        vegetables,
        meat,
      ];
}
