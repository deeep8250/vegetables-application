import 'package:first/animatedContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(randompositionS());

class randompositionS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: randomposition(),
    );
  }
}

class randomposition extends StatefulWidget {
  State<StatefulWidget> createState() => _random();
}

class _random extends State {
  List<String> image = [
    'icons/apple.png',
    'icons/banana.png',
    'icons/brocole.png',
    'icons/carrot.png',
    'icons/cucumber.png',
    'icons/grapes.png',
    'icons/orange.png',
    'icons/strawberry.png',
    'icons/tomato.png',
    'icons/unknownf.png',
    'icons/apple.png',
    'icons/banana.png',
    'icons/brocole.png',
    'icons/carrot.png',
    'icons/cucumber.png',
    'icons/grapes.png',
    'icons/orange.png',
    'icons/strawberry.png',
    'icons/tomato.png',
    'icons/unknownf.png',
  ];

  List<String> func() {
    List<String> random = List.from(image);
    random.shuffle();
    return random;
  }

  @override
  Widget build(BuildContext context) {
    final shuffleList = func();
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.0,
            crossAxisCount: 3,
          ),
          itemCount: shuffleList.length,

          itemBuilder: (context, index) {
            return Container(


              margin: EdgeInsets.all(2),
              child: InkWell(
                onTap: (){},
                child: ResponsiveContainer(imagepath: shuffleList[index]),
              ),
            );
          }),
    );
  }
}
