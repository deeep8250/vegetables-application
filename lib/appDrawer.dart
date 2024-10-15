import 'package:flutter/material.dart';

void main() {
  runApp(MyResponsiveDrawer());
}

class MyResponsiveDrawer extends StatelessWidget {
  const MyResponsiveDrawer ({super.key});



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;
    final heit = MediaQuery.of(context).size.height;
    precacheImage(const AssetImage('images/backg.jpg'), context);
    return Drawer(
      width: wid > 600 ? wid * 0.34 : wid * 0.5,
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Opacity(
              opacity: 0.6, // Adjust the opacity as needed
              child: Image.asset(
                'images/backg.jpg', // Your background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // ListView with options
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: wid > 600 ? heit * 0.3 : heit* 0.3,
                child: DrawerHeader(

                  decoration: const BoxDecoration(
                    color: Colors.transparent, // Make the header transparent
                  ),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Container(
                          color: Colors.blue,
                          child: Image.asset(
                            'assets/images/loginavtar.png',
                            fit: BoxFit.cover,
                            width: wid > 1024 ? wid * 0.07 : 80, // Responsive width
                            height: wid > 1024 ? wid * 0.07 : 80, // Responsive height
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "User's name",
                        style: TextStyle(
                          fontFamily: 'cute',
                          fontSize: wid > 600 ? wid * 0.018 : 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'xyz@gmail.com',
                        style: TextStyle(
                          fontFamily: 'cute',
                          fontSize: wid > 600 ? wid * 0.012 : 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black26,
                ),

                child: ListTile(
                  leading: Image.asset('images/orderhistory.png'),
                  title: Text(
                    'My Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: 'cute',
                      fontSize: wid > 600 ? 20 : 16,
                      color: Colors.green,
                      shadows: [
                        // Shadow(
                        //   blurRadius: 2.0,
                        //   color: Colors.white,
                        //   offset: Offset(1.0 ,2.0),
                        // ),
                      ],
                    ),
                  ),
                  onTap: () {
                    // Handle the Add to Cart action here
                  },
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black26,
                ),
                child: ListTile(
                  leading: Image.asset('images/feedback.png'),
                  title: Text('Feedback',
                    style: TextStyle(fontWeight: FontWeight.bold,
                      fontFamily: 'cute',
                      fontSize: wid > 600 ? 20 : 16,
                      color: Colors.green,

                    ),
                  ),
                  onTap: () {
                    // Handle the Feedback action here
                  },
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black26,
                ),
                child: ListTile(
                  leading: Image.asset('images/setting.png'),
                  title: Text('Settings',
                    style: TextStyle(fontWeight: FontWeight.bold,
                      fontFamily: 'cute',
                      fontSize: wid > 600 ? 20 : 16,
                      color: Colors.green,
                      shadows: [

                      ],
                    ),
                  ),
                  onTap: () {
                    // Handle the Settings action here
                  },
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black26,
                ),
                child: ListTile(
                  leading: Image.asset('images/signout.png'),
                  title: Text('Logout',
                    style: TextStyle(fontWeight: FontWeight.bold,
                      fontFamily: 'cute',
                      fontSize: wid > 600 ? 20 : 16,
                      color: Colors.green,
                      shadows: [

                      ],
                    ),
                  ),
                  onTap: () {
                    // Handle the Logout action here
                  },
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ],
      ),

    );
  }
}
