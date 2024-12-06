import 'package:flutter/material.dart';

class MealDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image and rating overlay
            Stack(
              children: [
                Image.asset(
                  'assets/mendi_rice.png',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 4),
                        Text("4.5", style: TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Meal details and nutritional information
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mendi Rice", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text("Suhani's Stop, Kukatpally", style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Description & Ingredient",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Valeur nutritionnelle", style: TextStyle(fontSize: 14, color: Colors.grey)),
                          SizedBox(height: 4),
                          Text("145 cal", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Our Fried Rice Is Made From The Finest Ingredients And Veggies. "
                        "Single Dish Is Made With Fresh Vegetables, Rescued.",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 16),

                  // Chips for details
                  Row(
                    children: [
                      Chip(
                        label: Text("Rescued", style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(width: 8),
                      Chip(
                        label: Text("Vegan", style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(width: 8),
                      Chip(
                        label: Text("30 min", style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.33),


                  // Additions
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Additions",
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Add to cart button
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Ajouter Au Panier"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
