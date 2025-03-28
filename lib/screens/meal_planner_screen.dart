import 'package:flutter/material.dart';

class MealPlannerScreen extends StatefulWidget {
  final Function(Map<String, List<String>>) updateGroceryList;

  MealPlannerScreen({required this.updateGroceryList});

  @override
  _MealPlannerScreenState createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  Map<String, List<String>> mealPlan = {
    "Monday": [],
    "Tuesday": [],
    "Wednesday": [],
    "Thursday": [],
    "Friday": [],
    "Saturday": [],
    "Sunday": [],
  };

  List<String> allRecipes = [
    "Vegan Salad",
    "Gluten-Free Pasta",
    "Chicken Stir Fry",
    "Mushroom Risotto",
    "Grilled Salmon",
    "Quinoa Bowl",
    "Tofu Stir Fry",
    "Beef Tacos",
    "Cauliflower Rice",
    "Paneer Butter Masala"
  ];

  void _addMeal(String day) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: allRecipes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(allRecipes[index]),
              onTap: () {
                setState(() {
                  mealPlan[day]!.add(allRecipes[index]);
                });
                widget.updateGroceryList(mealPlan);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meal Planner"), backgroundColor: Colors.deepOrange),
      body: ListView(
        children: mealPlan.keys.map((day) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ExpansionTile(
              title: Text(day, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              children: [
                ...mealPlan[day]!.map((meal) => ListTile(title: Text(meal))).toList(),
                TextButton(
                  onPressed: () => _addMeal(day),
                  child: Text("+ Add Meal", style: TextStyle(color: Colors.deepOrange)),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}