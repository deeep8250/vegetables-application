
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(RandomImagesApp());

class RandomImagesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RandomImagesScreen(),
     );
  }
}

class RandomImagesScreen extends StatefulWidget {
  @override
  _RandomImagesScreenState createState() => _RandomImagesScreenState();

                                               }

class _RandomImagesScreenState extends State<RandomImagesScreen> {
  final int imageCount = 2;
  final List<String> imagePaths = [
    'images/setting.png',
    'images/img.png',
    // 'images/image3.png',
    // 'images/image4.png',
    // 'images/image5.png',
    // 'images/image6.png',
    // 'images/image7.png',
    // 'images/image8.png',
    // 'images/image9.png',
    // 'images/image10.png',

      ];
  late List<Offset> positions;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _generateRandomPositions();
  }

  void _generateRandomPositions() {
    Random random = Random();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    positions = List.generate(imageCount, (_) {
      double x = random.nextDouble() * (screenWidth - 50); // Subtract image width
      double y = random.nextDouble() * (screenHeight - 50); // Subtract image height
      return Offset(x, y);
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: List.generate(imageCount, (index) {
          return Positioned(
            left: positions[index].dx,
            top: positions[index].dy,
            child: InkWell(
              onTap: () {
                // Define your tap action here
              },
              child: Image.asset(
                imagePaths[index],
                width: 50, // Adjust width to fit your image
                height: 50, // Adjust height to fit your image
              ),
            ),
          );

        }
        ),
      ),

    );
  }
}