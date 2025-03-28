import 'package:flutter/material.dart';

class MealPlannerScreen extends StatefulWidget {
  final Function(Map<String, List<String>>) updateGroceryList;

  MealPlannerScreen({required this.updateGroceryList});

  @override
  _MealPlannerScreenState createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  Map<String, List<Map<String, String>>> mealPlan =
      {}; // Stores meal details per day
  Map<String, List<String>> ingredientMap =
      {}; // Stores ingredients for Grocery List

  final List<Map<String, dynamic>> recipes = [
    {
      "name": "Vegan Salad",
      "image": "assets/vegansalad.jpeg",
      "ingredients": ["Lettuce", "Tomatoes", "Cucumber", "Olive Oil"],
    },
    {
      "name": "Gluten-Free Pasta",
      "image": "assets/pasta.jpeg",
      "ingredients": [
        "Gluten-Free Pasta",
        "Tomato Sauce",
        "Bell Peppers",
        "Onion",
      ],
    },
    {
      "name": "Chicken Stir Fry",
      "image": "assets/chickenstirfry.jpeg",
      "ingredients": ["Chicken", "Bell Peppers", "Soy Sauce", "Garlic"],
    },
    {
      "name": "Mushroom Risotto",
      "image": "assets/mushroomrisotto.jpeg",
      "ingredients": ["Arborio Rice", "Mushrooms", "Parmesan Cheese", "Onion"],
    },
    {
      "name": "Grilled Salmon",
      "image": "assets/grilledsalmon.jpeg",
      "ingredients": ["Salmon", "Lemon", "Garlic", "Olive Oil"],
    },
    {
      "name": "Quinoa Bowl",
      "image": "assets/quinoabowl.jpeg",
      "ingredients": ["Quinoa", "Black Beans", "Corn", "Tomatoes"],
    },
    {
      "name": "Tofu Stir Fry",
      "image": "assets/tofustirfry.jpeg",
      "ingredients": ["Tofu", "Broccoli", "Carrots", "Soy Sauce"],
    },
    {
      "name": "Beef Tacos",
      "image": "assets/beeftacos.jpeg",
      "ingredients": ["Beef", "Taco Shells", "Lettuce", "Cheese"],
    },
    {
      "name": "Cauliflower Rice",
      "image": "assets/cauliflowerrice.jpeg",
      "ingredients": ["Cauliflower", "Garlic", "Paprika", "Parsley"],
    },
    {
      "name": "Paneer Butter Masala",
      "image": "assets/paneer.jpeg",
      "ingredients": ["Paneer", "Tomato Puree", "Cream", "Spices"],
    },
    {
      "name": "Shrimp Scampi",
      "image": "assets/shrimp.jpeg",
      "ingredients": ["Shrimp", "Garlic", "Lemon", "Pasta"],
    },
    {
      "name": "Lentil Soup",
      "image": "assets/lentilsoup.jpeg",
      "ingredients": ["Lentils", "Carrots", "Celery", "Vegetable Broth"],
    },
    {
      "name": "Grilled Chicken",
      "image": "assets/grilledchicken.jpeg",
      "ingredients": ["Chicken Breast", "Garlic", "Olive Oil", "Rosemary"],
    },
    {
      "name": "Chickpea Stew",
      "image": "assets/chickpea.jpeg",
      "ingredients": ["Chickpeas", "Tomatoes", "Onions", "Cumin"],
    },
    {
      "name": "Vegetable Stir Fry",
      "image": "assets/vegetablestir.jpeg",
      "ingredients": ["Broccoli", "Carrots", "Soy Sauce", "Ginger"],
    },
  ];

  void addMeal(String day, Map<String, String> meal) {
    setState(() {
      if (!mealPlan.containsKey(day)) {
        mealPlan[day] = [];
      }
      mealPlan[day]!.add(meal);

      // Add ingredients to the grocery list
      List<String> ingredients =
          recipes.firstWhere(
            (recipe) => recipe["name"] == meal["name"],
          )["ingredients"];
      ingredientMap[meal["name"]!] = ingredients;
    });
    widget.updateGroceryList(ingredientMap);
  }

  @override
  Widget build(BuildContext context) {
    List<String> daysOfWeek = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Planner"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/grocery-list',
              ); // Navigate to Grocery List
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: daysOfWeek.length,
        itemBuilder: (context, index) {
          String day = daysOfWeek[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            elevation: 4,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    day,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      showAddMealDialog(context, day);
                    },
                    child: Text("Add Meal"),
                  ),
                ),
                mealPlan.containsKey(day) && mealPlan[day]!.isNotEmpty
                    ? Column(
                      children:
                          mealPlan[day]!.map((meal) {
                            return Card(
                              elevation: 3,
                              margin: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: ListTile(
                                leading: Image.asset(
                                  meal["image"]!,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(
                                  meal["name"]!,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          }).toList(),
                    )
                    : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "No meal added for $day",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/grocery-list',
            ); // Button to navigate to Grocery List
          },
          child: Text("Go to Grocery List"),
        ),
      ),
    );
  }

  void showAddMealDialog(BuildContext context, String day) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select a Recipe for $day"),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    recipes[index]["image"]!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(recipes[index]["name"]!),
                  onTap: () {
                    addMeal(day, {
                      "name": recipes[index]["name"]!,
                      "image": recipes[index]["image"]!,
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
