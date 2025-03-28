import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final Map<String, String> favoriteRecipes; // ✅ FIXED: Renamed parameter

  FavoritesScreen({required this.favoriteRecipes}); // ✅ FIXED: Correct constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        backgroundColor: Colors.deepOrange,
      ),
      body: favoriteRecipes.isEmpty
          ? Center(
              child: Text(
                "No favorite recipes added.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                String recipeName = favoriteRecipes.keys.elementAt(index);
                String recipeImage = favoriteRecipes[recipeName]!;

                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: Image.asset(
                      recipeImage,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(recipeName),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Removing from favorites should be handled via main.dart state
                      },
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/recipe-details',
                        arguments: {"name": recipeName, "image": recipeImage},
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
