import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(listTrack());

class listTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: list(),
    );
  }
}

class list extends StatefulWidget {
  State<StatefulWidget> createState() => listState();
}

class listState extends State {

  int  check = -1;
  List<Map<String, String>> fruits = [
    {'apple': 'apple'},
    {'fruits': 'fruits'},
    {'banana': 'banana'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30),
          itemCount: fruits.length,
          itemBuilder: (context, index) {
            print(index);
            var entry = fruits[index].entries.first; // Get the first entry from the map
            return GestureDetector(
              onTap: (){
                check = index;
              },


              child: Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: Text(
                  ' ${entry.value}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }),
    );
  }
}
