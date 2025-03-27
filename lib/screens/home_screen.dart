import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe & Meal Planner')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/recipes'),
              icon: Icon(Icons.restaurant_menu),
              label: Text('View Recipes'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/meal-planner'),
              icon: Icon(Icons.calendar_today),
              label: Text('Plan Meals'),
            ),
          ],
        ),
      ),
    );
  }
}
