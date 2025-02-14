import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  final int calories;
  final int price;
  final int count;

  const OrderItem({
    required this.calories,
    required this.price,
    required this.count,
  });

  @override
  List<Object> get props => [
        calories,
        price,
        count,
      ];

  OrderItem copyWith({
    int? calories,
    int? price,
    int? count,
  }) {
    return OrderItem(
      calories: calories ?? this.calories,
      price: price ?? this.price,
      count: count ?? this.count,
    );
  }

  factory OrderItem.initial() {
    return OrderItem(
      calories: 0,
      price: 0,
      count: 0,
    );
  }
}
