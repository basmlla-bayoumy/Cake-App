import 'package:cake_app/screens/login_screen.dart';
import 'package:cake_app/widgets/profileTileWidget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          const SizedBox(height: 10),

        
          Center(
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.pink.shade100,
              child: const Icon(Icons.person, size: 60, color: Colors.white),
            ),
          ),

          const SizedBox(height: 15),
          const Center(
            child: Text(
              "Basmala Mahmoud",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Center(
            child: Text(
              "basmala@gmail.com",
              style: TextStyle(color: Colors.grey),
            ),
          ),

          const SizedBox(height: 30),

          profileTile(Icons.shopping_bag_outlined, "My Orders"),
          profileTile(Icons.favorite_border, "Favorites"),
          profileTile(Icons.location_on_outlined, "Addresses"),
          profileTile(Icons.settings_outlined, "Settings"),

          const SizedBox(height: 40),

          SizedBox(
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: const Text(
                "Logout",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
