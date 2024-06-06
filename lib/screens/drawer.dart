import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/authenticationpage.dart';
import 'package:food_delivery_app/screens/bottomNavBar.dart';
import 'package:food_delivery_app/screens/drawer.dart';

import 'package:food_delivery_app/screens/homepage.dart';
import 'package:food_delivery_app/screens/myprofile.dart';
import 'package:food_delivery_app/screens/favourites.dart';
import 'package:food_delivery_app/screens/history.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFA4A0C),
      body: Stack(
        children: [
          // Background images (same as before)
          Positioned(
            right: 2,
            top: 120,
            child: Image(
              image: AssetImage("lib/assets/drawer_design1_shadow.png"),
            ),
          ),
          Positioned(
            top: 100,
            right: 0,
            child: Image(
              image: AssetImage("lib/assets/drawer_design1.png"),
            ),
          ),

          // Navigation menu items
          Positioned(
            left: 30,
            top: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               GestureDetector(
                 onTap: () {
                   Navigator.pop(context); // Close the drawer first
                   Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(builder: (context) => Home()),
                   ); // Navigate to Home screen
                 },
                  child: Row(
                    children: [
                      Icon(
                        Icons.home, // Use a built-in Material icon
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 40,
                ),

                // New menu items with navigation
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Close the drawer first
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Favourites()),
                    ); // Navigate to Favourites screen
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.star, // Use a Material icon for Favourites
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Favourites",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 40,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Close the drawer first
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyProfile()),
                    ); // Navigate to Profile screen
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_circle, // Use a Material icon for Profile
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 40,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Close the drawer first
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => History()),
                    ); // Navigate to Order History screen
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.history, // Use a Material icon for Order History
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Order History",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 40,
                ),
              ],
            ),
          ),

          // Sign Out button at the bottom
          Positioned(
            left: 30,
            bottom: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AuthenticationPage()),
                ); // Navigate to Order History screen
              },
              child: Row(
                children: [
                  Text(
                    "Sign Out",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.arrow_back, // Use an arrow icon for Sign Out
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
