import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe & Meal Planner'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          // Image banner
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'assets/home_banner.png', // Ensure this image exists
                width: double.infinity,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
          ),

          // Welcome Text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Welcome to Recipe & Meal Planner!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 20),

          // Buttons wrapped in expanded layout
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // View Recipes Button
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/recipes'),
                  icon: Icon(Icons.restaurant_menu, size: 28),
                  label: Text(
                    'Browse Recipes',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    backgroundColor: Colors.orangeAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // Plan Meals Button - FIXED
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/meal-planner'),
                  icon: Icon(Icons.calendar_today, size: 28),
                  label: Text(
                    'Plan Meals',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    backgroundColor: Colors.orangeAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // Favorites Button - FIXED
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/favorites'),
                  icon: Icon(Icons.favorite, size: 28, color: Colors.red),
                  label: Text(
                    'My Favorites',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    backgroundColor: Colors.orangeAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
