import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ColorToggleButton extends StatefulWidget {
  final String soundPath; // Path for the sound effect
  final String lottieUrl; // URL for the Lottie animation

  ColorToggleButton({required this.soundPath, required this.lottieUrl});

  @override
  _ColorToggleButtonState createState() => _ColorToggleButtonState();
}

class _ColorToggleButtonState extends State<ColorToggleButton> {
  final player = AudioPlayer();
  Color buttonColor = Colors.green;
  bool isGreen = true;
  bool isAnimating = false;
  bool btn = true;// Track animation visibility


  void _toggleButton() {
    setState(() {
      isGreen = !isGreen;
      buttonColor = isGreen ? Colors.green : Colors.red;
    });
  }

  void _onButtonPress() {
    if (isGreen) {
      // Show animation and change to red
      showLottieAnimation();
      playSound();
      _toggleButton();
    } else {
      // Just change to green
      _toggleButton();
    }
  }

  void showLottieAnimation() {
    setState(() {
      isAnimating = true; // Start the animation
    });

    // Close the animation after the duration
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isAnimating = false; // Stop the animation
      });
    });
  }

  Future<void> playSound() async {
    await player.play(AssetSource(widget.soundPath));
  }

  @override
  Widget build(BuildContext context) {
    late double screenW;
    late double screenH;

      setState(() {
        if(MediaQuery.of(context).size.width > 750) {
          screenW = 300;
          screenH = 80;
          btn = true;
        }
        else{
          screenW = 140;
          screenH = 60;
          btn = false;
        }
      });


    return Stack( // Use Stack to overlay the animation
      children: [
        Positioned(
          top:  MediaQuery.of(context).size.height*0.7,
          left: btn ? MediaQuery.of(context).size.width*0.38 : null,
          child: GestureDetector(
            onTap: _onButtonPress,
            child: AnimatedContainer(
              duration: isGreen ? Duration(seconds: 1) : Duration(milliseconds: 500),
              width: screenW,
              height: screenH,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                isGreen ? 'Add to cart' : 'Remove from cart',
                style: TextStyle(color: Colors.white,fontFamily: 'cute'),
              ),
            ),
          ),
        ),
        if (isAnimating) // Show Lottie animation conditionally
          Positioned(
           left: btn ? MediaQuery.of(context).size.width*0.37 : 50,
            child: AnimatedContainer(

              width: btn ? 300 : 240,
              height: btn ? 300 : 240,
              color: Colors.transparent,
              duration: Duration(seconds: 2),
              child: Lottie.network(
                widget.lottieUrl, // Use the passed Lottie URL
                fit: BoxFit.fill,
              ),
            ),
          ),
      ],
    );
  }
}
