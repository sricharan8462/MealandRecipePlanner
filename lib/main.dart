import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/recipe_list_screen.dart';
import 'screens/recipe_details_screen.dart';
import 'screens/meal_planner_screen.dart'; // Added
import 'screens/favorites_screen.dart'; // Added

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe & Meal Planner',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/recipes': (context) => RecipeListScreen(),
        '/recipe-details': (context) => RecipeDetailsScreen(),
        '/meal-planner':
            (context) => MealPlannerScreen(), // Fixed Plan Meal Button
        '/favorites': (context) => FavoritesScreen(), // Fixed Favorites Button
      },
    );
  }
}
