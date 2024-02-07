import 'package:flutter/material.dart';
import 'pages/seeds.dart';
import 'pages/equipment.dart';
import 'pages/fertilizers.dart';
import 'pages/irrigation.dart';
import 'pages/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Categories', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        toolbarHeight: 80.0,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildGridItem(context, 'Seeds', Icons.grass, 'assets/images/seeds.jpg', SeedListPage()),
          _buildGridItem(context, 'Equipment', Icons.build, 'assets/images/equipment.jpg', EquipmentListPage()),
          _buildGridItem(context, 'Irrigation', Icons.water, 'assets/images/irrigation.jpg', IrrigationListPage()),
          _buildGridItem(context, 'Fertilizer', Icons.emoji_nature, 'assets/images/fertilizer.jpg', FertilizerListPage()),
        ],
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
        onTap: (index) {
          // Handle BottomNavigationBarItem taps
          if (index == 2) {
            // Navigate to DoctorAppointmentApp page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          } else {
            // Handle other tabs if needed
          }
        },
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, IconData icon, String backgroundImage, Widget page) {
    return GestureDetector(
      onTap: () {
        // Navigate to the corresponding page when the grid item is tapped
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Card(
        elevation: 2.0,
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                backgroundImage,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: Container(
                  color: Colors.black12.withOpacity(0.7),
                ),
              ),
              Positioned(
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 50.0,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      title,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EquipmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipment Page'),
      ),
      body: Center(
        child: Text('This is the Equipment Page'),
      ),
    );
  }
}
