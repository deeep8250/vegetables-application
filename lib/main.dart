
import 'package:flutter/material.dart';

void main() => runApp( firstpage());

class firstpage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  mainsc(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.green .shade600),
      ),
    );
  }
}

class mainsc extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => mainscState();
}

class mainscState extends State<mainsc> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width1 = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height*0.06,
        title: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,  ),
            child: Container(width: 50,height:40,child: CircleAvatar(backgroundImage:AssetImage('images/logo2.png'),)),
          ),
          Padding(padding: EdgeInsets.only(left: 80,top: 6),

             child: Text('Apna Bazar',style: TextStyle(fontFamily: 'cute',fontSize: 20,fontWeight: FontWeight.w900,),),

           ),
        ],
        ),
      ),

    );
  }
}