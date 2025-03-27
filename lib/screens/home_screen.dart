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
            ElevatedButton(onPressed: () {}, child: Text('View Recipes')),
            ElevatedButton(onPressed: () {}, child: Text('Plan Meals')),
          ],
        ),
      ),
    );
  }
}
