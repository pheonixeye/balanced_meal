import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderSummaryContainer extends StatelessWidget {
  const OrderSummaryContainer({
    super.key,
    required this.orderCalories,
    required this.userCalories,
    required this.orderPrice,
    required this.isOrderWithinCalorieRange,
    required this.buttonText,
    required this.route,
  });
  final int orderCalories;
  final int userCalories;
  final int orderPrice;
  final bool isOrderWithinCalorieRange;
  final String buttonText;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 164,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8,
            ),
            child: Row(
              children: [
                Text(
                  'Cal',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                Text(
                  '$orderCalories Cal out of $userCalories Cal',
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
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8,
            ),
            child: Row(
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                Text(
                  r'$ ' '$orderPrice',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffF25700),
                  ),
                ),
              ],
            ),
          ),
          Row(
            spacing: 24,
            children: [
              const SizedBox(),
              Expanded(
                child: ElevatedButton(
                  onPressed: isOrderWithinCalorieRange
                      ? () {
                          GoRouter.of(context).goNamed(route);
                        }
                      : null,
                  child: Text(buttonText),
                ),
              ),
              const SizedBox(),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
