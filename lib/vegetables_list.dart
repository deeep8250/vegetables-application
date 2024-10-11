import 'package:flutter/material.dart';

void main() => runApp(const Myveges());

class Myveges extends StatelessWidget {
  const Myveges({super.key});

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
    'veges/bit.png',
    'veges/bringal.png',
    'veges/cabage.png',
    'veges/capsicum.png',
    'veges/carrot.png',
    'veges/coliflower.png',
    'veges/potato.png',
    'veges/tomato.png',
    'veges/brocole.png',
    'veges/potol.png',
    'veges/kochudata.png',
    'veges/kumro.png',
    'veges/echor.png',



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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white10 ,
          ),
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
                            child: Image.asset("assets/icons/${image[index]}", fit: BoxFit.fill),
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

                          child: Image.asset(

                            "assets/large_icons/" + image[showIndex],
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
