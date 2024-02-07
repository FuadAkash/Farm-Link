import 'package:flutter/material.dart';

void main() => runApp(ProfilePage());

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile Page'),
        ),
        body: ProfileWidget(
          name: 'John Doe',
          image: 'assets/images/1517272697202.jpeg',
          address: '123 Main Street, Cityville',
          farmTypes: ['Vegetables', 'Fruits', 'Livestock'],
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String name;
  final String image;
  final String address;
  final List<String> farmTypes;

  ProfileWidget({
    required this.name,
    required this.image,
    required this.address,
    required this.farmTypes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(image),
          ),
          SizedBox(height: 16),
          Text(
            name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            address,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Farm Types:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: farmTypes
                .map((type) => Text(
              '- $type',
              style: TextStyle(fontSize: 16),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
