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
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    List<String> filteredRecipes = recipes.where((recipe) {
      if (selectedFilter != "All" && !recipe.toLowerCase().contains(selectedFilter.toLowerCase())) {
        return false;
      }
      if (searchQuery.isNotEmpty && !recipe.toLowerCase().contains(searchQuery.toLowerCase())) {
        return false;
      }
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Recipes')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Recipes',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              ),
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
            ),
          ),
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
              itemCount: filteredRecipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredRecipes[index]),
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/recipe-details',
                    arguments: filteredRecipes[index],
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