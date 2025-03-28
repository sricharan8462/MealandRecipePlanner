import 'package:flutter/material.dart';

class GroceryListScreen extends StatelessWidget {
  final Map<String, List<String>> mealPlan; // ✅ FIXED: Expecting mealPlan

  GroceryListScreen({required this.mealPlan});

  @override
  Widget build(BuildContext context) {
    List<String> groceryItems =
        mealPlan.values.expand((items) => items).toSet().toList();

    return Scaffold(
      appBar: AppBar(title: Text("Grocery List")),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text(groceryItems[index]),
          );
        },
      ),
    );
  }
}
