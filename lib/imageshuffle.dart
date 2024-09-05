import 'package:first/animatedContainer.dart';
import 'package:flutter/material.dart';

void main() => runApp(const randompositionS());

class randompositionS extends StatelessWidget {
  const randompositionS({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: randomposition(),
    );
  }
}

class randomposition extends StatefulWidget {
  const randomposition({super.key});

  @override
  State<StatefulWidget> createState() => _random();
}

class _random extends State {
  List<String> image = [
    'icons/apple.png',
    'icons/apple.png',
    'icons/brocole.png',
    'icons/carrot.png',
    'icons/cucumber.png',
    'icons/grapes.png',
    'icons/orange.png',
    'icons/strawberry.png',
    'icons/tomato.png',
    'icons/unknownf.png',
    'icons/apple.png',
    'icons/apple.png',
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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.0,
            crossAxisCount: 3,
          ),
          itemCount: shuffleList.length,

          itemBuilder: (context, index) {
            return Container(


              margin: const EdgeInsets.all(2),
              child: InkWell(
                onTap: (){},
                child: ResponsiveContainer(imagepath: shuffleList[index]),
              ),
            );
          }),
    );
  }
}
