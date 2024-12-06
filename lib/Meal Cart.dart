import 'package:flutter/material.dart';

class Meal {
  final String name;
  final double price;
  final String image;

  Meal({required this.name, required this.price, required this.image});
}

class MealCartPage extends StatefulWidget {
  @override
  _MealCartPageState createState() => _MealCartPageState();
}

class _MealCartPageState extends State<MealCartPage> {
  // Map to track the count of each meal in the cart
  Map<Meal, int> cartItems = {};
  double total = 0.0;

  final List<Meal> meals = [
    Meal(name: "USDA Beef Ribs Finger", price: 389.000, image: 'assets/meal.png'),
    Meal(name: "LA Beef Ribs", price: 389.000, image: 'assets/meal.png'),
    Meal(name: "USDA Beef Outside", price: 389.000, image: 'assets/meal.png'),
    Meal(name: "USDA Beef Short Plate", price: 389.000, image: 'assets/meal.png'),
  ];

  void addToCart(Meal meal) {
    setState(() {
      if (cartItems.containsKey(meal)) {
        cartItems[meal] = cartItems[meal]! + 1;
      } else {
        cartItems[meal] = 1;
      }
      total += meal.price;
    });
  }

  void removeFromCart(Meal meal) {
    setState(() {
      if(!cartItems.containsKey(meal))return;
      if ( cartItems[meal]! > 1) {
        cartItems[meal] = cartItems[meal]! - 1;
      } else {
        cartItems.remove(meal);
      }
      total -= meal.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          "MealMate Restaurant",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: meals.length,
              itemBuilder: (context, index) {
                return _buildMealCard(meals[index]);
              },
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildMealCard(Meal meal) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            meal.image, // Replace with your image paths
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(meal.name),
        subtitle: Text("${meal.price.toStringAsFixed(3)} DZD"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove, color: Colors.red),
              onPressed: () => removeFromCart(meal),
            ),
            Text(
              "${cartItems[meal] ?? 0}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.green),
              onPressed: () => addToCart(meal),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${total.toStringAsFixed(3)} DZD",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              // Navigate to the cart page or handle cart actions
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Cart Items"),
                    content: Container(
                      height: 200,
                      child: ListView.builder(
                        itemCount: cartItems.keys.length,
                        itemBuilder: (context, index) {
                          final meal = cartItems.keys.elementAt(index);
                          final count = cartItems[meal]!;
                          return ListTile(
                            title: Text(meal.name),
                            subtitle: Text(
                              "${count} x ${meal.price.toStringAsFixed(3)} DZD = ${(count * meal.price).toStringAsFixed(3)} DZD",
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.remove_circle, color: Colors.red),
                              onPressed: () => removeFromCart(meal),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.shopping_cart, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
