import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(animatedContainer());

class animatedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveContainer(
        imagepath: '',
      ),
    );
  }
}

class ResponsiveContainer extends StatefulWidget {
  String imagepath;

  ResponsiveContainer({required this.imagepath});

  @override
  State<StatefulWidget> createState() => _ResponsiveContainerState();
}

class _ResponsiveContainerState extends State<ResponsiveContainer> {
  bool isEx = false;

  @override
  Widget build(BuildContext context) {
    // Getting screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Centered icon with InkWell for tap detection
          Center(
            child: InkWell(
              onTap: () {
                setState(() {
                  isEx = !isEx;
                });
              },
              child: Image.asset(
                widget.imagepath,
                width: 50,
                height: 50,
              ),
            ),
          ),
          // Full-screen container with animated opacity and size
          GestureDetector(
            onTap: () {
              setState(() {
                isEx = !isEx;
              });
            },
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: isEx ? screenWidth : 0,
                height: isEx ? screenHeight : 0,
                color: Colors.transparent,
              ),
            ),
          ),
          // Positioned image that animates based on screen size
          AnimatedPositioned(
            top: isEx ? screenHeight * 0.1 : screenHeight * 0.27,
            left: isEx ? (screenWidth / 2.9) : screenWidth / 2,
            duration: Duration(milliseconds: 700),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 600),
              height: isEx ? screenHeight * 0.34 : 0,
              width: isEx ? screenWidth * 0.4 : 0,
              child: Image.asset(widget.imagepath),
            ),
          ),

          Positioned(
            bottom: MediaQuery
                .of(context)
                .size
                .height * 0.2,
            left: MediaQuery
                .of(context)
                .size
                .width * 0.3,
            child: AnimatedOpacity(
              opacity: isEx ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.1,
                height: MediaQuery
                    .of(context)
                    .size
                    .width * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.green),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart, size: MediaQuery
                      .of(context)
                      .size
                      .width * 0.05,),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery
                .of(context)
                .size
                .height * 0.2,
            left: MediaQuery
                .of(context)
                .size
                .width * 0.59,
            child: AnimatedOpacity(
              opacity: isEx ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.1,
                height: MediaQuery
                    .of(context)
                    .size
                    .width * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.green),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart, size: MediaQuery
                      .of(context)
                      .size
                      .width * 0.05,),
                ),
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
