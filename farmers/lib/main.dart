import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/images/background_image.jpg', // Replace with your image asset
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Blur Overlay
          Container(
            color: Colors.black.withOpacity(0.3), // Adjust the opacity as needed
            width: double.infinity,
            height: double.infinity,
          ),
          // Welcome Text
          Positioned(
            top: 100.0, // Adjust the top position as needed
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Welcome to farm LINK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Average Sans', // Replace with your font family
                ),
              ),
            ),
          ),
          // Sign-up and Login Buttons
          Positioned(
            bottom: 250.0, // Adjust the bottom position as needed
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistrationPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 60.0),
                  ),
                  child: Text('Sign Up', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 60.0),
                  ),
                  child: Text('Log In', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
