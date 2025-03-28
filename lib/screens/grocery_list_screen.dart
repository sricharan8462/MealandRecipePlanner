import 'package:flutter/material.dart';

class GroceryListScreen extends StatefulWidget {
  final Map<String, List<String>> ingredientMap;

  GroceryListScreen({required this.ingredientMap});

  @override
  _GroceryListScreenState createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  Set<String> groceryList = {};
  Set<String> checkedItems = Set();

  @override
  void initState() {
    super.initState();
    updateGroceryList(widget.ingredientMap);
  }

  void updateGroceryList(Map<String, List<String>> ingredientMap) {
    setState(() {
      groceryList.clear();
      ingredientMap.forEach((_, ingredients) {
        groceryList.addAll(ingredients);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grocery List"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: groceryList.length,
              itemBuilder: (context, index) {
                final item = groceryList.elementAt(index);
                return CheckboxListTile(
                  title: Text(item),
                  value: checkedItems.contains(item),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        checkedItems.add(item);
                      } else {
                        checkedItems.remove(item);
                      }
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  groceryList.clear();
                  checkedItems.clear();
                });
              },
              child: Text("Clear All"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
