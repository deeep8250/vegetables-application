
import 'package:first/active_button_test.dart';
import 'package:flutter/material.dart';


class HomeScreen1 extends StatefulWidget {

  List <String> image = [];
   List <String> add_to_cart_items = [];
  late List <bool> imageS = [];

 HomeScreen1({required this.image,required this.add_to_cart_items, required this.imageS});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen1> {
   bool addtocart = true;

  int showIndex = -1;
  bool crcolor = true;



  @override
  Widget build(BuildContext context) {

    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:Colors.green.shade100,
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
              itemCount: widget.image.length,
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
                            child: Image.asset("assets/icons/" + widget.image[index],
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
                            "assets/large_icons/" + widget.image[showIndex],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Active1(index: showIndex, image: widget.image, imageS: widget.imageS, add_to_cart_items: widget.add_to_cart_items,),




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
