import 'package:flutter/material.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final List<String> recipes = [
    "Vegan Salad",
    "Gluten-Free Pasta",
    "Chicken Stir Fry",
    "Mushroom Risotto"
  ];
  
  String selectedFilter = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipes')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedFilter,
              items: ["All", "Vegan", "Gluten-Free", "Non-Vegetarian"]
                  .map((filter) => DropdownMenuItem(value: filter, child: Text(filter)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedFilter = value!;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recipes[index]),
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/recipe-details',
                    arguments: recipes[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}