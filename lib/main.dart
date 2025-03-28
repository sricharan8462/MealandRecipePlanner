import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/recipe_list_screen.dart';
import 'screens/recipe_details_screen.dart';
import 'screens/meal_planner_screen.dart';
import 'screens/grocery_list_screen.dart';
import 'screens/favorites_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, List<String>> mealPlan = {};
  Map<String, String> favoriteRecipes = {}; // ✅ FIXED: Renamed variable to match FavoritesScreen

  void addMealToPlanner(String recipeName, String recipeImage, List<String> ingredients) {
    setState(() {
      mealPlan[recipeName] = ingredients;
    });
  }

  void addToFavorites(String recipeName, String recipeImage) {
    setState(() {
      favoriteRecipes[recipeName] = recipeImage; // ✅ FIXED: Using correct variable name
    });
  }

  void updateGroceryList(Map<String, List<String>> mealPlan) {
    setState(() {
      this.mealPlan = mealPlan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe & Meal Planner',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/recipes': (context) => RecipeListScreen(),
        '/recipe-details': (context) => RecipeDetailsScreen(
              addMealToPlanner: addMealToPlanner,
              addToFavorites: addToFavorites,
            ),
        '/meal-planner': (context) => MealPlannerScreen(
              updateGroceryList: updateGroceryList,
            ),
        '/grocery-list': (context) => GroceryListScreen(
              ingredientMap: mealPlan,
            ),
        '/favorites': (context) => FavoritesScreen(
              favoriteRecipes: favoriteRecipes, // ✅ FIXED: Using correct parameter name
            ),
      },
    );
  }
}
