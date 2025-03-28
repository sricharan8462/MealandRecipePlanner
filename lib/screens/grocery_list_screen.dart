import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class GroceryListScreen extends StatefulWidget {
  final Map<String, List<String>> ingredientMap;

  GroceryListScreen({required this.ingredientMap});

  @override
  _GroceryListScreenState createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  List<String> groceryList = [];

  final Map<String, List<String>> recipeIngredients = {
    "Vegan Salad": ["1 cup lettuce", "1/2 cup cherry tomatoes", "1/4 cup cucumbers", "1 tbsp olive oil", "1 tsp lemon juice"],
    "Gluten-Free Pasta": ["200g gluten-free pasta", "1/2 cup tomato sauce", "1/4 cup bell peppers", "1/4 cup onions", "1/2 tsp oregano"],
    "Chicken Stir Fry": ["200g chicken breast", "1/2 cup bell peppers", "1/4 cup onions", "2 tbsp soy sauce", "1 tbsp sesame oil"],
    "Mushroom Risotto": ["1 cup Arborio rice", "1/2 cup mushrooms", "1/4 cup onions", "2 cups vegetable broth", "1/4 cup Parmesan cheese"],
    "Grilled Salmon": ["2 salmon fillets", "1 tbsp olive oil", "1 tbsp lemon juice", "1 tsp garlic powder"],
    "Quinoa Bowl": ["1 cup quinoa", "1/2 cup black beans", "1/2 cup corn", "1/4 cup tomatoes", "1/4 cup onions"],
    "Tofu Stir Fry": ["200g firm tofu", "1/2 cup broccoli", "1/4 cup carrots", "1 tbsp soy sauce", "1 tsp sesame oil"],
    "Beef Tacos": ["200g ground beef", "1 tbsp taco seasoning", "4 taco shells", "1/2 cup lettuce", "1/4 cup tomatoes"],
    "Cauliflower Rice": ["1 medium cauliflower", "1 tbsp olive oil", "1/4 cup onions", "1 tsp garlic", "1/4 cup vegetable broth"],
    "Paneer Butter Masala": ["200g paneer", "1 cup tomato puree", "1/4 cup cream", "1 tbsp butter", "1 tsp garam masala"],
    "Shrimp Scampi": ["200g shrimp", "2 tbsp butter", "2 cloves garlic", "1/2 cup white wine", "1 tbsp lemon juice"],
    "Lentil Soup": ["1 cup lentils", "1/2 cup carrots", "1/4 cup celery", "1/4 cup onions", "2 cups vegetable broth"],
    "Grilled Chicken": ["2 chicken breasts", "1 tbsp olive oil", "1 tsp paprika", "1 tsp garlic powder", "1/2 tsp oregano"],
    "Chickpea Stew": ["1 can chickpeas", "1/2 cup tomatoes", "1/4 cup onions", "2 cups vegetable broth", "1 tsp cumin"],
    "Vegetable Stir Fry": ["1 cup broccoli", "1/2 cup bell peppers", "1/4 cup carrots", "1 tbsp soy sauce", "1 tsp ginger"],
  };

  @override
  void initState() {
    super.initState();
    _loadGroceryList();
  }

  List<String> generateGroceryList() {
    Set<String> list = {};
    widget.ingredientMap.forEach((day, meals) {
      for (String meal in meals) {
        if (recipeIngredients.containsKey(meal)) {
          list.addAll(recipeIngredients[meal]!);
        }
      }
    });
    return list.toList();
  }

  void _saveGroceryList() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('groceryList', jsonEncode(groceryList));
  }

  void _loadGroceryList() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedData = prefs.getString('groceryList');
    if (storedData != null) {
      setState(() {
        groceryList = List<String>.from(jsonDecode(storedData));
      });
    } else {
      setState(() {
        groceryList = generateGroceryList();
      });
      _saveGroceryList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grocery List"), backgroundColor: Colors.deepOrange),
      body: groceryList.isEmpty
          ? Center(child: Text("No ingredients yet. Add meals first."))
          : ListView.builder(
              itemCount: groceryList.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(groceryList[index]));
              },
            ),
    );
  }
}