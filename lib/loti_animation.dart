import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loti1 extends StatefulWidget {
  final bool reciver;
  final VoidCallback onAnimationComplete;
  Loti1({Key? key, required this.reciver, required this.onAnimationComplete});

  @override
  State<StatefulWidget> createState() => LotiState();
}

class LotiState extends State<Loti1> with SingleTickerProviderStateMixin {
  bool isAnimationVisible = true; // To control animation visibility
  final player = AudioPlayer();
  late AnimationController _controller;
  final AudioCache _audioCache = AudioCache(prefix: 'sound_effect/');

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
    // Add listener to check when animation is completed
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isAnimationVisible = false; // Hide the animation when done
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose controller when no longer needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300, // Size for better visibility
        height: 300,
        color: Colors.transparent,
        child: widget.reciver || !isAnimationVisible
            ? null // Hide the animation after it completes
            : LottieBuilder.network(
                'https://lottie.host/b4235781-4299-48e5-8ccc-ef6a9f89097e/uT8gQhK51m.json',
               controller: _controller,
               onLoaded: (composition) {
                 _controller
                 ..duration = composition.duration
                 ..forward(); // Start animation playback
              },
              errorBuilder: (context, error, stackTrace) {
               return Text('Error loading animation: $error');
            },
        ),
      ),
    );
  }

  void playSound() {}
}
