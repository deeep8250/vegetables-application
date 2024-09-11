import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      width: 200,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Remove any default padding from ListView
          children: [
            // Drawer header with avatar and name
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue, // Background color for header
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 40.0, // Size of the avatar
                    backgroundImage: AssetImage('assets/images/loginavtar.png'),
                  ),
                  SizedBox(height: 10), // Space between avatar and name
                  Text(
                    'Name', // User's name
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // List of options below the header
            ListTile(
              leading: Icon(Icons.home), // Icon for the option
              title: Text('Home'),        // Label for the option
              onTap: () {
                // Handle tap for 'Home' option
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // Handle tap for 'Profile' option
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle tap for 'Settings' option
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle tap for 'Logout' option
              },
            ),
          ],
        ),
      ),
    );
  }
}
