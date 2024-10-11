import 'package:flutter/material.dart';

class MyResponsiveDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final wid = MediaQuery.of(context).size.width;
    final heit = MediaQuery.of(context).size.height;

    // Determine if the device is large (e.g., a PC or tablet)
    final isLargeScreen = wid > 600;


    return Drawer(
      width: isLargeScreen ? wid*0.35 : null, // Adjust the width to be 60% of the screen width
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero, // Remove default padding for the drawer
          children: [
            // User header
            UserAccountsDrawerHeader(
              accountName: Text(
                "User's name",
                style: TextStyle(
                  fontFamily: 'cute',
                  fontSize: isLargeScreen ? 18 : wid * 0.05, // Fixed size on large screens
                ),
              ),
              accountEmail: Text(
                'xywz@gmail.com',
                style: TextStyle(
                  fontSize: isLargeScreen ? 16 : wid * 0.04, // Fixed size on large screens
                ),
              ),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(wid * 0.12), // Responsive border radius
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/loginavtar.png',
                    fit: BoxFit.cover,
                    width: isLargeScreen ? 80 : wid * 0.2, // Fixed size on large screens
                    height: isLargeScreen ? 80 : wid * 0.2,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/backg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: heit * 0.02), // Responsive spacing
            _buildListTile(
              wid,
              heit,
              'assets/images/orderhistory.png',
              'Cart',
                  () {
                // Handle cart tap
              },
            ),
            SizedBox(height: heit * 0.02),
            _buildListTile(
              wid,
              heit,
              'assets/images/setting.png',
              'Settings',
                  () {
                // Handle settings tap
              },
            ),
            SizedBox(height: heit * 0.02),
            _buildListTile(
              wid,
              heit,
              'assets/images/feedback.png',
              'Feedback',
                  () {
                // Handle feedback tap
              },
            ),
            SizedBox(height: heit * 0.02),
            _buildListTile(
              wid,
              heit,
              'assets/images/signout.png',
              'Sign out',
                  () {
                // Handle sign out tap
              },
            ),
          ],
        ),
      ),
    );
  }

  // A helper method to create a ListTile with responsiveness
  Widget _buildListTile(double wid, double heit, String imagePath, String title, VoidCallback onTap) {
    final isLargeScreen = wid > 600; // Determine large screen

    return Container(
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(wid * 0.04), // Responsive border radius
      ),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: isLargeScreen ? 40 : wid * 0.08, // Fixed size for large screens
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: isLargeScreen ? 16 : wid * 0.045, // Fixed size for large screens
            fontFamily: 'cute',
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Responsive Drawer Example'),
      ),
      drawer: MyResponsiveDrawer(), // Adding our responsive drawer
      body: Center(
        child: Text('Swipe from left to open the drawer'),
      ),
    ),
  ));
}
