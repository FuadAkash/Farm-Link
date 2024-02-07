import 'package:flutter/material.dart';

class Equipment {
  final String name;
  final double price;
  final String imageUrl;

  Equipment({required this.name, required this.price, required this.imageUrl});
}

class EquipmentListPage extends StatefulWidget {
  @override
  _EquipmentListPageState createState() => _EquipmentListPageState();
}

class _EquipmentListPageState extends State<EquipmentListPage> {
  List<Equipment> equipments = [
    Equipment(name: 'Disc Harrow', price: 15000, imageUrl: 'assets/images/Disc-Harrow.jpg'),
    Equipment(name: 'Tractors', price: 300000, imageUrl: 'assets/images/trucktor.jpg'),
    Equipment(name: 'Combine', price: 1000000, imageUrl: 'assets/images/combine.jpg'),
    // Add more seeds as needed
  ];

  Map<Equipment, int> cart = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Equipments', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        toolbarHeight: 80.0,
      ),
      body: ListView.builder(
        itemCount: equipments.length,
        itemBuilder: (context, index) {
          final seed = equipments[index];
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

  void addToCart(Equipment equip) {
    setState(() {
      if (cart.containsKey(equip)) {
        cart[equip] = cart[equip]! + 1;
      } else {
        cart[equip] = 1;
      }
    });
  }

  void removeFromCart(Equipment equip) {
    setState(() {
      if (cart.containsKey(equip)) {
        if (cart[equip]! > 1) {
          cart[equip] = cart[equip]! - 1;
        } else {
          cart.remove(equip);
        }
      }
    });
  }
}
