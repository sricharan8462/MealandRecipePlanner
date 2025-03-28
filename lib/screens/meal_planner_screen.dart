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

  Map<String, List<String>> ingredientMap = {}; // Store ingredients

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Planner"),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children:
            mealPlan.keys.map((day) {
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 6),
                child: ExpansionTile(
                  title: Text(
                    day,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    if (mealPlan[day]!.isEmpty)
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "No meals planned",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ...mealPlan[day]!.map(
                      (meal) => ListTile(
                        title: Text(meal),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              mealPlan[day]!.remove(meal);
                              ingredientMap.remove(meal);
                              widget.updateGroceryList(ingredientMap);
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }

  void addMeal(String day, String meal, List<String> ingredients) {
    setState(() {
      mealPlan[day]!.add(meal);
      ingredientMap[meal] = ingredients;
      widget.updateGroceryList(ingredientMap);
    });
  }
}
