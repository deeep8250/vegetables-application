import 'package:flutter/material.dart';

void main() => runApp(const MyAppq());

class MyAppq extends StatelessWidget {
  const MyAppq({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int showIndex = -1;
  bool dvh = true;
  List<String> image = [
    'fruits/banana.png',
    'fruits/apple.png',
    'fruits/avacado.png',
    'fruits/bedana.png',
    'fruits/coconut.png',
    'fruits/cucumber.png',
    'fruits/drag.png',
    'fruits/grapes.png',
    'fruits/green_grapes.png',
    'fruits/guava.png',
    'fruits/khajur.png',
    'fruits/lichi.png',
    'fruits/mango.png',
    'fruits/orange.png',
    'fruits/papaya.png',
    'fruits/pineapple.png',
    'fruits/strawberry.png',
    'fruits/unknownf.png',
    'fruits/watermelon.png',

  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (MediaQuery.of(context).size.width > 750) {
        setState(() {
          dvh = !dvh;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: deviceHeight * 0.01),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _getCrossAxisCount(context),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: image.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      showIndex = (showIndex == index) ? -1 : index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    transform: Matrix4.identity()
                      ..translate(0.0, showIndex == index ? -10.0 : 0.0),
                    child: Container(
                      padding: const EdgeInsets.all(1.0),
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset("icons/"+image[index], fit: BoxFit.fill),
                          ),

                        ],
                      ),
                    ),
                  ),
                );

              },
            ),
          ),
          if (showIndex >= 0)
            Positioned(
              top: 0,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showIndex = -1;
                  });
                },
                child: AnimatedContainer(
                  width: deviceWidth,
                  height: deviceHeight,
                  color: Colors.black54,
                  duration: const Duration(milliseconds: 500),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: deviceHeight * 0.2,
                        left: deviceWidth * 0.06,
                        child: SizedBox(
                          width: deviceWidth * 0.8,
                          height: deviceHeight * 0.8,
                          child: Image.asset(
                            "large_icons/" + image[showIndex],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20.0,
                        bottom: 30.0,
                        child: IconButton(
                          onPressed: () {
                            // Add cart logic here
                          },
                          icon: const Icon(Icons.shopping_cart, color: Colors.green, size: 40.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 100).toInt();
    return crossAxisCount > 0 ? crossAxisCount : 1;
  }
}
