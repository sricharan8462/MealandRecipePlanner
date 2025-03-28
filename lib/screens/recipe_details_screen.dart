import 'package:flutter/material.dart';

class RecipeDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FIX: Explicitly cast arguments to prevent IdentityMap error
    final Object? args = ModalRoute.of(context)!.settings.arguments;

    if (args == null || args is! Map<String, String>) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(
          child: Text(
            "Recipe details not available.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
      );
    }

    final Map<String, String> recipeData = args;
    final String recipeName = recipeData["name"]!;
    final String recipeImage = recipeData["image"]!;

    // Recipe details (Ingredients & Steps)
    final Map<String, dynamic> recipeDetails = {
      "Vegan Salad": {
        "ingredients": [
          "1 cup lettuce (chopped)",
          "1/2 cup cherry tomatoes (halved)",
          "1/4 cup cucumbers (sliced)",
          "1 tbsp olive oil",
          "1 tsp lemon juice",
          "Salt & black pepper to taste"
        ],
        "steps": [
          "Wash and chop all vegetables.",
          "In a large bowl, mix lettuce, tomatoes, and cucumbers.",
          "Drizzle olive oil and lemon juice.",
          "Season with salt and black pepper.",
          "Toss everything together and serve fresh."
        ]
      },
      "Gluten-Free Pasta": {
        "ingredients": [
          "200g gluten-free pasta",
          "1/2 cup tomato sauce",
          "1/4 cup bell peppers (chopped)",
          "1/4 cup onions (chopped)",
          "1/2 tsp oregano",
          "Salt & pepper to taste"
        ],
        "steps": [
          "Boil pasta as per the package instructions.",
          "Heat a pan and sauté onions & bell peppers.",
          "Add tomato sauce and let it simmer for 5 minutes.",
          "Season with oregano, salt, and black pepper.",
          "Mix the cooked pasta with the sauce, toss well and serve hot."
        ]
      },
      "Chicken Stir Fry": {
        "ingredients": [
          "200g boneless chicken breast (thinly sliced into strips)",
          "1/2 cup mixed bell peppers (red, yellow, green - thinly sliced)",
          "1/4 cup red onions (sliced into thin wedges)",
          "2 tablespoons low-sodium soy sauce",
          "1 tablespoon sesame oil",
          "1 teaspoon fresh garlic (minced)",
          "1 teaspoon fresh ginger (grated)",
          "1 tablespoon cornstarch",
          "2 tablespoons water",
          "1 tablespoon green onions (chopped, for garnish)"
        ],
        "steps": [
          "In a small bowl, mix cornstarch with water to create a slurry, then coat the chicken strips and set aside.",
          "Heat sesame oil in a large wok or skillet over medium-high heat.",
          "Add minced garlic and grated ginger, sautéing for 30 seconds until fragrant.",
          "Add the coated chicken strips and stir-fry for 4-5 minutes until golden and cooked through.",
          "Toss in the sliced bell peppers and onions, stir-frying for another 3-4 minutes until crisp-tender.",
          "Pour in the soy sauce and stir well to coat all ingredients evenly.",
          "Remove from heat, sprinkle with chopped green onions, and serve hot with steamed jasmine rice or noodles."
        ]
      },
      "Mushroom Risotto": {
        "ingredients": [
          "1 cup Arborio rice (short-grain Italian rice)",
          "1/2 cup cremini mushrooms (cleaned and thinly sliced)",
          "1/4 cup white onions (finely chopped)",
          "2 cups low-sodium vegetable broth (warmed)",
          "1/4 cup grated Parmesan cheese",
          "1 tablespoon unsalted butter",
          "2 tablespoons dry white wine (optional)",
          "1 teaspoon fresh thyme (chopped)",
          "Salt and freshly ground black pepper to taste"
        ],
        "steps": [
          "Melt butter in a large, heavy-bottomed pan over medium heat.",
          "Add chopped onions and sauté for 2-3 minutes until translucent.",
          "Stir in the sliced mushrooms and cook for 4-5 minutes until they release their moisture and brown slightly.",
          "Add the Arborio rice and stir for 2 minutes to toast lightly, ensuring each grain is coated with butter.",
          "If using, pour in the white wine and stir until it’s fully absorbed by the rice.",
          "Begin adding the warm vegetable broth, one ladle at a time, stirring constantly and allowing each addition to be absorbed before adding more.",
          "Continue this process for 18-20 minutes until the rice is creamy and al dente.",
          "Stir in Parmesan cheese and thyme, then season with salt and pepper.",
          "Serve immediately in shallow bowls, garnished with extra cheese if desired."
        ]
      },
      "Grilled Salmon": {
        "ingredients": [
          "2 salmon fillets (skin-on, about 150g each)",
          "1 tablespoon extra virgin olive oil",
          "1 tablespoon freshly squeezed lemon juice",
          "1 teaspoon garlic powder",
          "1/2 teaspoon smoked paprika",
          "Sea salt and freshly ground black pepper to taste",
          "1 tablespoon fresh dill (chopped, for garnish)",
          "Lemon wedges (for serving)"
        ],
        "steps": [
          "Preheat your grill to medium heat (about 400°F/200°C) and lightly oil the grates.",
          "Pat the salmon fillets dry with paper towels to ensure a good sear.",
          "In a small bowl, mix olive oil, lemon juice, garlic powder, smoked paprika, salt, and pepper to make a marinade.",
          "Brush the marinade generously over both sides of the salmon fillets.",
          "Place the fillets skin-side down on the grill and cook for 5-6 minutes.",
          "Carefully flip the fillets and grill for another 3-4 minutes until the flesh flakes easily with a fork.",
          "Remove from the grill, sprinkle with fresh dill, and serve hot with lemon wedges on the side."
        ]
      },
      "Quinoa Bowl": {
        "ingredients": [
          "1 cup quinoa (rinsed thoroughly)",
          "1/2 cup canned black beans (rinsed and drained)",
          "1/2 cup sweet corn kernels (fresh or frozen)",
          "1/4 cup cherry tomatoes (halved)",
          "1/4 cup red onions (finely diced)",
          "1 tablespoon fresh lime juice",
          "1 tablespoon olive oil",
          "1/2 teaspoon ground cumin",
          "Salt and freshly ground black pepper to taste",
          "2 tablespoons fresh cilantro (chopped)"
        ],
        "steps": [
          "Rinse the quinoa under cold water, then cook it in 2 cups of water according to package instructions (about 15 minutes).",
          "Once cooked, fluff the quinoa with a fork and let it cool slightly.",
          "In a large mixing bowl, combine the cooked quinoa, black beans, corn, cherry tomatoes, and red onions.",
          "In a small bowl, whisk together lime juice, olive oil, cumin, salt, and pepper to make the dressing.",
          "Pour the dressing over the quinoa mixture and toss gently to combine.",
          "Sprinkle with fresh cilantro and mix lightly.",
          "Serve chilled or at room temperature in bowls, optionally with a lime wedge on the side."
        ]
      },
      "Tofu Stir Fry": {
        "ingredients": [
          "200g firm tofu (pressed and cut into 1-inch cubes)",
          "1/2 cup broccoli florets (fresh or blanched)",
          "1/4 cup carrots (thinly sliced diagonally)",
          "1/4 cup snap peas (trimmed)",
          "2 tablespoons low-sodium soy sauce",
          "1 tablespoon sesame oil",
          "1 teaspoon fresh ginger (grated)",
          "1 teaspoon cornstarch",
          "2 tablespoons water",
          "1 tablespoon sesame seeds (toasted, for garnish)"
        ],
        "steps": [
          "Press the tofu between paper towels for 15 minutes to remove excess moisture, then cube it.",
          "In a small bowl, mix cornstarch with water to create a slurry, then toss the tofu cubes in it.",
          "Heat sesame oil in a wok or large skillet over medium-high heat.",
          "Add grated ginger and sauté for 30 seconds until aromatic.",
          "Add the coated tofu and stir-fry for 5-6 minutes until golden and crispy on all sides.",
          "Toss in broccoli, carrots, and snap peas, stir-frying for 4-5 minutes until vibrant and tender-crisp.",
          "Pour in soy sauce and stir to coat evenly, cooking for an additional minute.",
          "Remove from heat, sprinkle with toasted sesame seeds, and serve hot with rice or noodles."
        ]
      },
      "Beef Tacos": {
        "ingredients": [
          "200g lean ground beef",
          "1 tablespoon taco seasoning (store-bought or homemade)",
          "4 hard taco shells (or soft tortillas)",
          "1/2 cup iceberg lettuce (finely shredded)",
          "1/4 cup Roma tomatoes (diced)",
          "1/4 cup sharp cheddar cheese (shredded)",
          "2 tablespoons sour cream",
          "1 tablespoon fresh cilantro (chopped)",
          "Lime wedges (for serving)"
        ],
        "steps": [
          "Heat a large skillet over medium heat and add the ground beef.",
          "Cook the beef, breaking it apart with a spatula, for 6-8 minutes until fully browned.",
          "Drain excess fat, then stir in taco seasoning and 2 tablespoons of water, simmering for 3 minutes.",
          "While the beef cooks, warm the taco shells in the oven at 350°F (175°C) for 5 minutes or according to package instructions.",
          "Assemble the tacos by spooning the seasoned beef into each shell.",
          "Top with shredded lettuce, diced tomatoes, cheddar cheese, a dollop of sour cream, and a sprinkle of cilantro.",
          "Serve immediately with lime wedges on the side for an extra zesty kick."
        ]
      },
      "Cauliflower Rice": {
        "ingredients": [
          "1 medium head cauliflower (about 4 cups when riced)",
          "1 tablespoon olive oil",
          "1/4 cup yellow onions (finely chopped)",
          "1 teaspoon fresh garlic (minced)",
          "1/4 cup vegetable broth",
          "1/2 teaspoon smoked paprika",
          "Sea salt and freshly ground black pepper to taste",
          "1 tablespoon fresh parsley (chopped, for garnish)"
        ],
        "steps": [
          "Remove the leaves and stem from the cauliflower, then chop into florets.",
          "Pulse the florets in a food processor until they resemble rice grains (work in batches if needed).",
          "Heat olive oil in a large skillet over medium heat.",
          "Add chopped onions and minced garlic, sautéing for 2-3 minutes until fragrant.",
          "Stir in the cauliflower rice and smoked paprika, cooking for 5-7 minutes until slightly softened.",
          "Pour in the vegetable broth and stir well, allowing it to simmer for 2-3 minutes until absorbed.",
          "Season with salt and pepper to taste, then remove from heat.",
          "Garnish with fresh parsley and serve warm as a low-carb side dish."
        ]
      },
      "Paneer Butter Masala": {
        "ingredients": [
          "200g paneer (cut into 1-inch cubes)",
          "1 cup fresh tomato puree (from 2-3 ripe tomatoes)",
          "1/4 cup heavy cream",
          "1 tablespoon unsalted butter",
          "1 teaspoon ginger-garlic paste",
          "1 teaspoon garam masala",
          "1/2 teaspoon red chili powder",
          "1/2 teaspoon turmeric powder",
          "Salt to taste",
          "1 tablespoon fresh cilantro (chopped, for garnish)"
        ],
        "steps": [
          "Melt butter in a large skillet over medium heat.",
          "Add ginger-garlic paste and sauté for 1 minute until aromatic.",
          "Stir in the tomato puree, red chili powder, turmeric, and salt, cooking for 5-7 minutes until the oil separates.",
          "Add garam masala and stir well, then reduce heat to low.",
          "Pour in the heavy cream and mix until the sauce thickens slightly, about 2-3 minutes.",
          "Gently add the paneer cubes, coating them evenly in the sauce, and simmer for 5 minutes.",
          "Remove from heat, garnish with fresh cilantro, and serve hot with naan or basmati rice."
        ]
      },
      "Shrimp Scampi": {
        "ingredients": [
          "200g large shrimp (peeled, deveined, tails on)",
          "2 tablespoons unsalted butter",
          "2 cloves garlic (finely minced)",
          "1/2 cup dry white wine (like Sauvignon Blanc)",
          "1 tablespoon freshly squeezed lemon juice",
          "1/4 teaspoon red pepper flakes",
          "Salt and freshly ground black pepper to taste",
          "1/4 cup fresh parsley (finely chopped)",
          "Lemon zest (from 1 lemon, for garnish)"
        ],
        "steps": [
          "Melt butter in a large skillet over medium heat.",
          "Add minced garlic and red pepper flakes, sautéing for 30 seconds until fragrant.",
          "Add the shrimp in a single layer and cook for 2-3 minutes per side until pink and opaque.",
          "Pour in the white wine and lemon juice, stirring to deglaze the pan, and simmer for 2-3 minutes until slightly reduced.",
          "Season with salt and pepper to taste.",
          "Stir in fresh parsley and remove from heat.",
          "Garnish with lemon zest and serve immediately over linguine or with crusty bread."
        ]
      },
      "Lentil Soup": {
        "ingredients": [
          "1 cup dried green lentils (rinsed and drained)",
          "1/2 cup carrots (peeled and diced)",
          "1/4 cup celery (finely chopped)",
          "1/4 cup yellow onions (finely diced)",
          "2 cups low-sodium vegetable broth",
          "1 teaspoon ground cumin",
          "1/2 teaspoon smoked paprika",
          "Salt and freshly ground black pepper to taste",
          "1 tablespoon olive oil",
          "1 tablespoon fresh parsley (chopped, for garnish)"
        ],
        "steps": [
          "Rinse the lentils under cold water until the water runs clear, then set aside.",
          "Heat olive oil in a large pot over medium heat.",
          "Add onions, carrots, and celery, sautéing for 4-5 minutes until softened.",
          "Stir in cumin and smoked paprika, cooking for 1 minute to toast the spices.",
          "Add the lentils and vegetable broth, bringing the mixture to a boil.",
          "Reduce heat to low, cover, and simmer for 30-35 minutes until the lentils are tender.",
          "Season with salt and pepper to taste.",
          "Ladle into bowls, garnish with fresh parsley, and serve hot with crusty bread."
        ]
      },
      "Grilled Chicken": {
        "ingredients": [
          "2 boneless chicken breasts (about 200g each)",
          "1 tablespoon olive oil",
          "1 teaspoon smoked paprika",
          "1 teaspoon garlic powder",
          "1/2 teaspoon onion powder",
          "1/2 teaspoon dried oregano",
          "Sea salt and freshly ground black pepper to taste",
          "1 tablespoon fresh rosemary (chopped, for garnish)",
          "Lemon wedges (for serving)"
        ],
        "steps": [
          "Preheat your grill to medium-high heat (about 425°F/220°C) and brush the grates with oil.",
          "Pat the chicken breasts dry with paper towels.",
          "In a small bowl, mix olive oil, smoked paprika, garlic powder, onion powder, oregano, salt, and pepper to make a marinade.",
          "Rub the marinade evenly over both sides of the chicken breasts.",
          "Place the chicken on the grill and cook for 6-8 minutes per side, or until the internal temperature reaches 165°F (74°C).",
          "Remove from the grill and let rest for 5 minutes to retain juices.",
          "Garnish with fresh rosemary and serve hot with lemon wedges and a side salad."
        ]
      },
      "Chickpea Stew": {
        "ingredients": [
          "1 can (15 oz) chickpeas (drained and rinsed)",
          "1/2 cup canned diced tomatoes (with juice)",
          "1/4 cup red onions (finely chopped)",
          "2 cups low-sodium vegetable broth",
          "1 teaspoon ground cumin",
          "1/2 teaspoon ground coriander",
          "1/4 teaspoon smoked paprika",
          "Salt and freshly ground black pepper to taste",
          "1 tablespoon olive oil",
          "1 tablespoon fresh cilantro (chopped, for garnish)"
        ],
        "steps": [
          "Heat olive oil in a large pot over medium heat.",
          "Add chopped onions and sauté for 3-4 minutes until translucent.",
          "Stir in cumin, coriander, and smoked paprika, cooking for 1 minute to release the aromas.",
          "Add the diced tomatoes, chickpeas, and vegetable broth, stirring to combine.",
          "Bring the mixture to a gentle boil, then reduce heat to low and simmer for 20-25 minutes.",
          "Season with salt and pepper to taste.",
          "Ladle into bowls, garnish with fresh cilantro, and serve warm with crusty bread or rice."
        ]
      },
      "Vegetable Stir Fry": {
        "ingredients": [
          "1 cup broccoli florets (fresh or blanched)",
          "1/2 cup mixed bell peppers (red, yellow, sliced thinly)",
          "1/4 cup carrots (julienned)",
          "1/4 cup snap peas (trimmed)",
          "2 tablespoons low-sodium soy sauce",
          "1 tablespoon sesame oil",
          "1 teaspoon fresh garlic (minced)",
          "1 teaspoon fresh ginger (grated)",
          "1 tablespoon cornstarch",
          "2 tablespoons water",
          "1 tablespoon green onions (chopped, for garnish)"
        ],
        "steps": [
          "In a small bowl, mix cornstarch with water to create a slurry and set aside.",
          "Heat sesame oil in a large wok or skillet over medium-high heat.",
          "Add minced garlic and grated ginger, sautéing for 30 seconds until fragrant.",
          "Toss in broccoli, bell peppers, carrots, and snap peas, stir-frying for 5-6 minutes until vibrant and tender-crisp.",
          "Pour in the soy sauce and cornstarch slurry, stirring quickly to thicken the sauce and coat the vegetables.",
          "Cook for an additional 1-2 minutes until the sauce clings to the veggies.",
          "Remove from heat, sprinkle with chopped green onions, and serve hot over steamed rice or noodles."
        ]
      }// Add remaining 13 recipes in the same format...
    };

    final List<String> ingredients = recipeDetails[recipeName]?["ingredients"] ?? [];
    final List<String> steps = recipeDetails[recipeName]?["steps"] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipeName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  recipeImage,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.broken_image, size: 100, color: Colors.grey);
                  },
                ),
              ),
              SizedBox(height: 20),

              // Recipe Title
              Text(
                recipeName,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.deepOrange),
              ),
              SizedBox(height: 10),

              // Ingredients Section
              Text(
                "🍽️ Ingredients",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Divider(thickness: 2),
              SizedBox(height: 5),
              ...ingredients.map((ingredient) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Text("• $ingredient",
                        style: TextStyle(fontSize: 18)),
                  )),

              SizedBox(height: 20),

              // Steps Section
              Text(
                "👨‍🍳 How to Prepare",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Divider(thickness: 2),
              SizedBox(height: 5),
              ...steps.map((step) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      "🔸 ${steps.indexOf(step) + 1}. $step",
                      style: TextStyle(fontSize: 18),
                    ),
                  )),

              SizedBox(height: 30),

              // Buttons - Add to Meal Planner & Favorites
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$recipeName added to Meal Planner!')),
                      );
                    },
                    icon: Icon(Icons.calendar_today),
                    label: Text("Add to Meal Planner"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$recipeName added to Favorites!')),
                      );
                    },
                    icon: Icon(Icons.favorite, color: Colors.red),
                    label: Text("Add to Favorites"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
