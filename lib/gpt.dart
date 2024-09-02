import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(randompositionS());



class randompositionS extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: randomposition(),
    );
  }

}


class randomposition extends StatefulWidget {

  State<StatefulWidget> createState() => _random();
}

class _random extends State {

  List<String> image = [
    'images/logo.jpg',
    'images/feedback.png',
    'images/order history.png',
    'images/setting.png',
    'images/sign out.png',
    'images/img.png',
    'images/card.jpeg',
  ];
   List <String> func () {
     List<String> random = List.from(image);
       random.shuffle();
        return random;
    }

  @override
  Widget build(BuildContext context) {
       final shuffleList = func();
       return Scaffold(body: GridView.builder(
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                   ),
                   itemCount: shuffleList.length,
                   itemBuilder: (context , index){
                          return Container(
                                  margin: EdgeInsets.all(12),
                                  color: Colors.black38,
                            child: Image.asset(shuffleList[index]),
                          );

                   }
       ),
       );
  }
}
