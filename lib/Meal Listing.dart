import 'package:flutter/material.dart';

class MealListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back, color: Colors.black),
          title: Text(
            "MealMate Restaurant",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Rechercher",
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              labelColor: Colors.green,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.green,
              tabs: [
                Tab(text: "Entrées"),
                Tab(text: "Plats"),
                Tab(text: "Desserts"),
                Tab(text: "Boissons"),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/meal.png', width: 60, height: 60, fit: BoxFit.cover),
                      ),
                      title: Text("USDA Beef Ribs Finger"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("389.000 DA"),
                          Row(
                            children: List.generate(5, (i) {
                              return Icon(
                                i < 4 ? Icons.star : Icons.star_border,
                                color: i < 4 ? Colors.amber : Colors.grey,
                                size: 16,
                              );
                            }),
                          ),
                        ],
                      ),
                      trailing: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("0.000 DZD", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.shopping_cart, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
