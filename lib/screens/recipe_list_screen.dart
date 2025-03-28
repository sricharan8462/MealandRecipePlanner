import 'package:flutter/material.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final List<Map<String, String>> recipes = [
    {"name": "Vegan Salad", "type": "Vegan", "image": "assets/vegansalad.jpeg"},
    {"name": "Gluten-Free Pasta", "type": "Gluten-Free", "image": "assets/pasta.jpeg"},
    {"name": "Chicken Stir Fry", "type": "Non-Vegetarian", "image": "assets/chickenstirfry.jpeg"},
    {"name": "Mushroom Risotto", "type": "Vegetarian", "image": "assets/mushroomrisotto.jpeg"},
    {"name": "Grilled Salmon", "type": "Non-Vegetarian", "image": "assets/grilledsalmon.jpeg"},
    {"name": "Quinoa Bowl", "type": "Vegan", "image": "assets/quinoabowl.jpeg"},
    {"name": "Tofu Stir Fry", "type": "Vegan", "image": "assets/tofustirfry.jpeg"},
    {"name": "Beef Tacos", "type": "Non-Vegetarian", "image": "assets/beeftacos.jpeg"},
    {"name": "Cauliflower Rice", "type": "Gluten-Free", "image": "assets/cauliflowerrice.jpeg"},
    {"name": "Paneer Butter Masala", "type": "Vegetarian", "image": "assets/paneer.jpeg"},
    {"name": "Shrimp Scampi", "type": "Non-Vegetarian", "image": "assets/shrimp.jpeg"},
    {"name": "Lentil Soup", "type": "Vegan", "image": "assets/lentilsoup.jpeg"},
    {"name": "Grilled Chicken", "type": "Non-Vegetarian", "image": "assets/grilledchicken.jpeg"},
    {"name": "Chickpea Stew", "type": "Vegan", "image": "assets/chickpea.jpeg"},
    {"name": "Vegetable Stir Fry", "type": "Vegan", "image": "assets/vegetablestir.jpeg"},
  ];

  String selectedFilter = "All";
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredRecipes = recipes.where((recipe) {
      if (selectedFilter != "All" && recipe["type"] != selectedFilter) {
        return false;
      }
      if (searchQuery.isNotEmpty &&
          !recipe["name"]!.toLowerCase().contains(searchQuery.toLowerCase())) {
        return false;
      }
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange,
        elevation: 2,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Recipes',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
            ),
          ),

          // Filter Dropdown
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedFilter,
              items: ["All", "Vegan", "Gluten-Free", "Vegetarian", "Non-Vegetarian"]
                  .map((filter) => DropdownMenuItem(
                        value: filter,
                        child: Text(filter),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedFilter = value!;
                });
              },
            ),
          ),

          // Recipe Grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredRecipes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/recipe-details',
                      arguments: {
                        "name": filteredRecipes[index]["name"] ?? "Unknown Recipe",
                        "image": filteredRecipes[index]["image"] ?? "assets/default_recipe.jpg",
                      },
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        // Recipe Image with Error Handling
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.asset(
                              filteredRecipes[index]["image"]!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.broken_image, size: 80, color: Colors.grey);
                              },
                            ),
                          ),
                        ),

                        // Recipe Name
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            filteredRecipes[index]["name"]!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange[700],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        // Recipe Type Badge
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _getTypeColor(filteredRecipes[index]["type"]!),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            filteredRecipes[index]["type"]!,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to set different colors for recipe types
  Color _getTypeColor(String type) {
    switch (type) {
      case "Vegan":
        return Colors.green;
      case "Gluten-Free":
        return Colors.blue;
      case "Vegetarian":
        return Colors.orange;
      case "Non-Vegetarian":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
