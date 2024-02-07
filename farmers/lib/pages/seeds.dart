import 'package:flutter/material.dart';

class Seed {
  final String name;
  final double price;
  final String imageUrl;

  Seed({required this.name, required this.price, required this.imageUrl});
}

class SeedListPage extends StatefulWidget {
  @override
  _SeedListPageState createState() => _SeedListPageState();
}

class _SeedListPageState extends State<SeedListPage> {
  List<Seed> seeds = [
    Seed(name: 'Tomato Seeds', price: 150, imageUrl: 'assets/images/tomato-seed.jpg'),
    Seed(name: 'Carrot Seeds', price: 300, imageUrl: 'assets/images/carrot-seeds.jpg'),
    Seed(name: 'Lettuce Seeds', price: 100, imageUrl: 'assets/images/lettuce-seeds.jpg'),
    // Add more seeds as needed
  ];

  Map<Seed, int> cart = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Seeds', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        toolbarHeight: 80.0,
      ),
      body: ListView.builder(
        itemCount: seeds.length,
        itemBuilder: (context, index) {
          final seed = seeds[index];
          final itemCount = cart.containsKey(seed) ? cart[seed] : 0;

          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Image.asset(seed.imageUrl),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    seed.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '৳${seed.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16),
                  ),

                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      removeFromCart(seed);
                    },
                  ),
                  Text(itemCount.toString()),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      addToCart(seed);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.deepOrangeAccent),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.deepOrangeAccent),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.deepOrangeAccent),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list, color: Colors.deepOrangeAccent),
            label: 'Tasks',
          ),
        ],
      ),
    );
  }

  void addToCart(Seed seed) {
    setState(() {
      if (cart.containsKey(seed)) {
        cart[seed] = cart[seed]! + 1;
      } else {
        cart[seed] = 1;
      }
    });
  }

  void removeFromCart(Seed seed) {
    setState(() {
      if (cart.containsKey(seed)) {
        if (cart[seed]! > 1) {
          cart[seed] = cart[seed]! - 1;
        } else {
          cart.remove(seed);
        }
      }
    });
  }
}
