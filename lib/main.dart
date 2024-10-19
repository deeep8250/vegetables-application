import 'dart:math';

import 'package:first/appDrawer.dart';
import 'package:first/fruits_list.dart';
import 'package:first/vegetables_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(const firstpage());

class firstpage extends StatelessWidget {
  const firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('images/backg.jpg'), context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const mainsc(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color:Colors.green),
      ),
    );
  }
}

class mainsc extends StatefulWidget {
  const mainsc({super.key});

  @override
  State<StatefulWidget> createState() => mainscState();
}

class mainscState extends State<mainsc> {
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage('assets/images/backg.jpg') , context);
    precacheImage(AssetImage('assets/images/loginavtar.png') , context);

  }
  @override
  void initState() {
    super.initState();
    image.shuffle(Random());
  }

  @override
  Widget build(BuildContext context) {



    final height = MediaQuery.of(context).size.height;
    final width1 = MediaQuery.of(context).size.width;
    precacheImage(const AssetImage('images/backg.jpg'), context);

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: height * 0.06,
            title: const Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 1,
                    left: 20,
                  ),
                  child: SizedBox(
                      width: 50,
                      height: 40,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/logo2.png'),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80, top: 6),
                  child: Text(
                    'Bhojon Bazar',
                    style: TextStyle(
                      fontFamily: 'cute',
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Container(
                color: Colors.green.shade300,


                child: TabBar(
                  tabs: [
                    Tab(icon: Image.asset('assets/images/fruitsb.png')),
                    Tab(icon: Image.asset('assets/images/vegesb.png')),
                  ],
                  indicatorColor: Colors.blue, // Color of the selected tab underline// Color of the selected tab's text and icon
                ),
              ),
            ),
          ),
          drawer: Container( width : width1 > 600 ? width1 * 0.34 : width1 * 0.5, child: MyResponsiveDrawer()),

          body:TabBarView(children: [
            HomeScreen1( image:image, add_to_cart_items: add_to_cart_items, imageS: imageS,),
            Myveges(),
          ],
          ) ,

        ));
  }
}
