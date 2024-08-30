
import 'package:first/animatedContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main()=>runApp(er());


class er extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: erin(),
    );
  }

}
class erin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => erinState();

}

class erinState extends State{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       child: ResponsiveContainer(imagepath: 'images/feedback.png'),
     ),
   );
  }

}