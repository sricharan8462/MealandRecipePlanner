import 'package:flutter/material.dart';

class RecipeListScreen extends StatelessWidget {
  final List<String> recipes = [
    "Vegan Salad",
    "Gluten-Free Pasta",
    "Chicken Stir Fry",
    "Mushroom Risotto"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipes')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index]),
            onTap: () => Navigator.pushNamed(
              context,
              '/recipe-details',
              arguments: recipes[index], // Pass recipe name
            ),
          );
        },
      ),
    );
  }
}