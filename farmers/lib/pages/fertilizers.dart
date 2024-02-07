import 'package:flutter/material.dart';

class Fertilizer {
  final String name;
  final double price;
  final String imageUrl;

  Fertilizer({required this.name, required this.price, required this.imageUrl});
}

class FertilizerListPage extends StatefulWidget {
  @override
  _FertilizerListPageState createState() => _FertilizerListPageState();
}

class _FertilizerListPageState extends State<FertilizerListPage> {
  List<Fertilizer> fertilizers = [
    Fertilizer(name: 'Nitrogen Fertilizer', price: 500, imageUrl: 'assets/images/nitrogen.jpg'),
    Fertilizer(name: 'Phosphorus Fertilizer', price: 400, imageUrl: 'assets/images/phosphet.png'),
    Fertilizer(name: 'Potassium Fertilizer', price: 350, imageUrl: 'assets/images/potassium.jpg'),
    // Add more fertilizers as needed
  ];

  Map<Fertilizer, int> cart = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Fertilizers', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        toolbarHeight: 80.0,
      ),
      body: ListView.builder(
        itemCount: fertilizers.length,
        itemBuilder: (context, index) {
          final fertilizer = fertilizers[index];
          final itemCount = cart.containsKey(fertilizer) ? cart[fertilizer] : 0;

          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Image.asset(fertilizer.imageUrl),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fertilizer.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '৳${fertilizer.price.toStringAsFixed(2)}',
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
                      removeFromCart(fertilizer);
                    },
                  ),
                  Text(itemCount.toString()),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      addToCart(fertilizer);
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
            icon: Icon(Icons.home, color: Colors.green),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.green),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.green),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list, color: Colors.green),
            label: 'Tasks',
          ),
        ],
      ),
    );
  }

  void addToCart(Fertilizer fertilizer) {
    setState(() {
      if (cart.containsKey(fertilizer)) {
        cart[fertilizer] = cart[fertilizer]! + 1;
      } else {
        cart[fertilizer] = 1;
      }
    });
  }

  void removeFromCart(Fertilizer fertilizer) {
    setState(() {
      if (cart.containsKey(fertilizer)) {
        if (cart[fertilizer]! > 1) {
          cart[fertilizer] = cart[fertilizer]! - 1;
        } else {
          cart.remove(fertilizer);
        }
      }
    });
  }
}
