import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class loti1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => lotiState();
}

class lotiState extends State<loti1> with SingleTickerProviderStateMixin {
final player = AudioPlayer();
  late AnimationController controller;
  bool isAnimationVisible = true;
  final AudioCache _audioCache = AudioCache();

  @override
  void initState() {

    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2 ));

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isAnimationVisible = false;
          _audioCache.load('sound_effect/bell.mp3');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              controller.forward();
            });

            playSound();
          },
          child: isAnimationVisible ? Container(
            width: 300, // Increased width
            height: 300, // Increased height
            child: LottieBuilder.network(
              'https://lottie.host/b4235781-4299-48e5-8ccc-ef6a9f89097e/uT8gQhK51m.json', // Using a .json file
              controller: controller,

            ),
          ):SizedBox.shrink(),

        ),

    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> playSound() async {
    String path = 'sound_effect/bell.mp3';
    await player.play(AssetSource(path));
  }
}



