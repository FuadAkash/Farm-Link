import 'package:flutter/material.dart';

class IrrigationSystem {
  final String name;
  final double price;
  final String imageUrl;

  IrrigationSystem({required this.name, required this.price, required this.imageUrl});
}

class IrrigationListPage extends StatefulWidget {
  @override
  _IrrigationListPageState createState() => _IrrigationListPageState();
}

class _IrrigationListPageState extends State<IrrigationListPage> {
  List<IrrigationSystem> irrigationSystems = [
    IrrigationSystem(name: 'Drip Irrigation', price: 2000, imageUrl: 'assets/images/drip_irrigation.jpg'),
    IrrigationSystem(name: 'Sprinkler System', price: 1500, imageUrl: 'assets/images/sprinkler_system.jpg'),
    IrrigationSystem(name: 'Flood Irrigation', price: 1000, imageUrl: 'assets/images/flood_irrigation.jpeg'),
    // Add more irrigation systems as needed
  ];

  Map<IrrigationSystem, int> cart = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Irrigation Systems', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        toolbarHeight: 80.0,
      ),
      body: ListView.builder(
        itemCount: irrigationSystems.length,
        itemBuilder: (context, index) {
          final irrigationSystem = irrigationSystems[index];
          final itemCount = cart.containsKey(irrigationSystem) ? cart[irrigationSystem] : 0;

          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Image.asset(irrigationSystem.imageUrl),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    irrigationSystem.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '৳${irrigationSystem.price.toStringAsFixed(2)}',
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
                      removeFromCart(irrigationSystem);
                    },
                  ),
                  Text(itemCount.toString()),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      addToCart(irrigationSystem);
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
            icon: Icon(Icons.home, color: Colors.blue),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.blue),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.blue),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list, color: Colors.blue),
            label: 'Tasks',
          ),
        ],
      ),
    );
  }

  void addToCart(IrrigationSystem irrigationSystem) {
    setState(() {
      if (cart.containsKey(irrigationSystem)) {
        cart[irrigationSystem] = cart[irrigationSystem]! + 1;
      } else {
        cart[irrigationSystem] = 1;
      }
    });
  }

  void removeFromCart(IrrigationSystem irrigationSystem) {
    setState(() {
      if (cart.containsKey(irrigationSystem)) {
        if (cart[irrigationSystem]! > 1) {
          cart[irrigationSystem] = cart[irrigationSystem]! - 1;
        } else {
          cart.remove(irrigationSystem);
        }
      }
    });
  }
}
