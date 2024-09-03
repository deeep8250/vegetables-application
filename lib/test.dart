import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ert());

class ert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: we(),
    );
  }
}

class we extends StatefulWidget {
  State<StatefulWidget> createState() => weState();
}

class weState extends State {
  int showindex = -1;
  List<String> image = [
    'icons/apple.png',
    'icons/banana.png',
    'icons/tomato.png'
  ];

  @override
  Widget build(BuildContext context) {
    final deviceWT = MediaQuery.of(context).size.width;
    final deviceHT = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: deviceHT * 0.16),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2.0, crossAxisCount: 3),
              itemCount: image.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (showindex == index) {
                        showindex = -1;
                      } else {
                        showindex = index;
                      }
                    });
                  },
                  child: AnimatedContainer(
                    width: 100,
                    height: 100,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      child: Image.asset(image[index]),
                      width: 100,
                      height: 100,
                    ),
                  ),
                );
              },
            ),
          ),
          if (showindex >= 0)
            Positioned(
              top: 10,
              left: (deviceWT/2)-100,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                   showindex = -1;
                  });
                },
                child: AnimatedContainer(
                    width: 200,
                    height: 200,

                    duration: Duration(milliseconds: 500),
                    child: Image.asset(image[showindex],
                      width: 200,height: 200,)
                ),
              ),
            )
        ],
      ),
    );
  }
}
