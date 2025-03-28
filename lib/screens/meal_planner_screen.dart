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

  void _goToGroceryList() {
    Navigator.pushNamed(context, '/grocery-list', arguments: mealPlan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meal Planner"), backgroundColor: Colors.deepOrange),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: mealPlan.keys.map((day) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ExpansionTile(
                    title: Text(day, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    children: mealPlan[day]!.isEmpty
                        ? [Padding(padding: EdgeInsets.all(10), child: Text("No meals added"))]
                        : mealPlan[day]!.map((meal) => ListTile(title: Text(meal))).toList(),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton.icon(
              onPressed: _goToGroceryList,
              icon: Icon(Icons.shopping_cart),
              label: Text("Go to Grocery List"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}