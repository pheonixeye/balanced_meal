// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  final String? id;
  final String food_name;
  final int calories;
  final String image_url;
  final int price;

  const Ingredient({
    required this.id,
    required this.food_name,
    required this.calories,
    required this.image_url,
    this.price = 12,
  });

  Ingredient copyWith({
    String? id,
    String? food_name,
    int? calories,
    String? image_url,
  }) {
    return Ingredient(
      id: id ?? this.id,
      food_name: food_name ?? this.food_name,
      calories: calories ?? this.calories,
      image_url: image_url ?? this.image_url,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'food_name': food_name,
      'calories': calories,
      'image_url': image_url,
    };
  }

  factory Ingredient.fromJson(
    String id,
    Map<String, dynamic> map, [
    int price = 12,
  ]) {
    return Ingredient(
      id: id,
      food_name: map['food_name'] as String,
      calories: map['calories'] as int,
      image_url: map['image_url'] as String,
      price: price,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        food_name,
        calories,
        image_url,
      ];
}
