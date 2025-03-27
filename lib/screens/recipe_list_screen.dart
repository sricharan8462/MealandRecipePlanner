import 'package:flutter/material.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final List<Map<String, String>> recipes = [
    {"name": "Vegan Salad", "type": "Vegan", "image": "assets/vegansalad.jpeg"},
    {
      "name": "Gluten-Free Pasta",
      "type": "Gluten-Free",
      "image": "assets/pasta.jpeg",
    },
    {
      "name": "Chicken Stir Fry",
      "type": "Non-Vegetarian",
      "image": "assets/chickenstirfry.jpeg",
    },
    {
      "name": "Mushroom Risotto",
      "type": "Vegetarian",
      "image": "assets/mushroomrisotto.jpeg",
    },
    {
      "name": "Grilled Salmon",
      "type": "Non-Vegetarian",
      "image": "assets/grilledsalmon.jpeg",
    },
    {"name": "Quinoa Bowl", "type": "Vegan", "image": "assets/quinoabowl.jpeg"},
    {
      "name": "Tofu Stir Fry",
      "type": "Vegan",
      "image": "assets/tofustirfry.jpeg",
    },
    {
      "name": "Beef Tacos",
      "type": "Non-Vegetarian",
      "image": "assets/beeftacos.jpeg",
    },
    {
      "name": "Cauliflower Rice",
      "type": "Gluten-Free",
      "image": "assets/cauliflowerrice.jpeg",
    },
    {
      "name": "Paneer Butter Masala",
      "type": "Vegetarian",
      "image": "assets/paneer.jpeg",
    },
    {
      "name": "Shrimp Scampi",
      "type": "Non-Vegetarian",
      "image": "assets/shrimp.jpeg",
    },
    {"name": "Lentil Soup", "type": "Vegan", "image": "assets/lentilsoup.jpeg"},
    {
      "name": "Grilled Chicken",
      "type": "Non-Vegetarian",
      "image": "assets/grilledchicken.jpeg",
    },
    {"name": "Chickpea Stew", "type": "Vegan", "image": "assets/chickpea.jpeg"},
    {
      "name": "Vegetable Stir Fry",
      "type": "Vegan",
      "image": "assets/vegetablestir.jpeg",
    },
  ];

  String selectedFilter = "All";
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredRecipes =
        recipes.where((recipe) {
          if (selectedFilter != "All" && recipe["type"] != selectedFilter) {
            return false;
          }
          if (searchQuery.isNotEmpty &&
              !recipe["name"]!.toLowerCase().contains(
                searchQuery.toLowerCase(),
              )) {
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
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedFilter,
              items:
                  [
                        "All",
                        "Vegan",
                        "Gluten-Free",
                        "Vegetarian",
                        "Non-Vegetarian",
                      ]
                      .map(
                        (filter) => DropdownMenuItem(
                          value: filter,
                          child: Text(filter),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  selectedFilter = value!;
                });
              },
            ),
          ),
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
                        "name": filteredRecipes[index]["name"],
                        "image": filteredRecipes[index]["image"],
                      },
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: Image.asset(
                              filteredRecipes[index]["image"]!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            filteredRecipes[index]["name"]!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
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
}