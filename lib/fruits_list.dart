import 'dart:math';

import 'package:first/active_button_test.dart';
import 'package:first/loti_animation.dart';
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
   bool addtocart = true;

  int showIndex = -1;
  bool crcolor = true;

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









  late List <String> add_to_cart_items = List.filled(image.length, '');
  late List <bool> imageS = List.filled(image.length , true);

  @override
  void initState() {
    super.initState();
    image.shuffle(Random());
  }

  @override
  Widget build(BuildContext context) {


    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:Color(0xFFFFEB3B)
      ,
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
                            child: Image.asset("assets/icons/" + image[index],
                                fit: BoxFit.fill),
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
                        bottom: deviceHeight * 0.45,
                        left: deviceWidth * 0.2,
                        child: SizedBox(
                          width: deviceWidth * 0.6,
                          height: deviceHeight * 0.6,
                          child: Image.asset(
                            "assets/large_icons/" + image[showIndex],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // Positioned(
                      //   bottom: 50,
                      //   left: 80,
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       setState(() {
                      //
                      //         if(imageS[showIndex] == true){
                      //           add_to_cart_items[showIndex] = image[showIndex];
                      //           imageS[showIndex] = false;
                      //         }else{
                      //           add_to_cart_items[showIndex] = '';
                      //           imageS[showIndex] = true;
                      //         }
                      //         print(add_to_cart_items);
                      //
                      //        // Toggle the addtocart value
                      //       });
                      //     },
                      //     child: Container(
                      //       color: imageS[showIndex] ? Colors.green : Colors.red,
                      //       width: 200,
                      //       height: 100,
                      //     ),
                      //   ),
                      // ),
                      Active1(index: showIndex, image: image, imageS: imageS, add_to_cart_items: add_to_cart_items),




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
