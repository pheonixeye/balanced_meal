import 'package:balanced_meal/components/ingredient_card.dart';
import 'package:balanced_meal/providers/px_ingredients.dart';
import 'package:balanced_meal/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PxIngredients>(
      builder: (context, i, _) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Create Your Order'),
              leading: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(Icons.arrow_left_outlined),
              ),
            ),
            body: ListView(
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text('Vegetables'),
                  ),
                  subtitle: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 12,
                      children: [
                        if (i.model == null)
                          SizedBox(
                            height: 80,
                            child: Expanded(
                              child: LinearProgressIndicator(),
                            ),
                          )
                        else
                          ...i.model!.vegetables.map((veg) {
                            return IngredientCard(ingredient: veg);
                          }),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text('Meats'),
                  ),
                  subtitle: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 12,
                      children: [
                        if (i.model == null)
                          SizedBox(
                            height: 80,
                            child: Expanded(
                              child: LinearProgressIndicator(),
                            ),
                          )
                        else
                          ...i.model!.meat.map((meat) {
                            return IngredientCard(ingredient: meat);
                          }),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text('Carbs'),
                  ),
                  subtitle: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 12,
                      children: [
                        if (i.model == null)
                          SizedBox(
                            height: 80,
                            child: Expanded(
                              child: LinearProgressIndicator(),
                            ),
                          )
                        else
                          ...i.model!.carbs.map((carb) {
                            return IngredientCard(ingredient: carb);
                          }),
                      ],
                    ),
                  ),
                ),
                Container(
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
                            Text('Cal'),
                            Spacer(),
                            Text('1000 Cal out of 1200 Cal'),
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
                            Text('Price'),
                            Spacer(),
                            Text(r'$ ' '125'),
                          ],
                        ),
                      ),
                      Row(
                        spacing: 24,
                        children: [
                          const SizedBox(),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                GoRouter.of(context).goNamed(AppRouter.summary);
                              },
                              child: Text('Place Order'),
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
