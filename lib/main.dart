import 'package:first/appDrawer.dart';
import 'package:first/fruits_list.dart';
import 'package:first/vegetables_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(const firstpage());

class firstpage extends StatelessWidget {
  const firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const mainsc(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xFF8BC34A)),
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
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width1 = MediaQuery.of(context).size.width;

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
                color: Colors.red,


                child: TabBar(
                  tabs: [
                    Tab(icon: Image.asset('assets/images/fruitsb.png')),
                    Tab(icon: Image.asset('assets/images/vegesb.png')),
                  ],
                  indicatorColor: Colors
                      .blue, // Color of the selected tab underline// Color of the selected tab's text and icon
                ),
              ),
            ),
          ),
          drawer:
              MyResponsiveDrawer(),

          body:TabBarView(children: [
            MyAppq(),
            Myveges(),
          ],
          ) ,

        ));
  }
}
