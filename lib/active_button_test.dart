import 'package:flutter/material.dart';
import 'loti_animation.dart';

class Active1 extends StatefulWidget {
  final int index; // Accepting initial color
  final List<String> image;
  final List<bool> imageS;
  final List<String> add_to_cart_items;

  Active1({
    Key? key,
    required this.index,
    required this.image,
    required this.imageS,
    required this.add_to_cart_items,
  });

  @override
  State<StatefulWidget> createState() => ActiveState();
}

class ActiveState extends State<Active1> {
  bool showanimation = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height*0.6,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (widget.imageS[widget.index] == true) {
                    widget.add_to_cart_items[widget.index] = widget.image[widget.index];
                    widget.imageS[widget.index] = false;
                    showanimation =  true;
                  } else {
                    widget.add_to_cart_items[widget.index] = '';
                    widget.imageS[widget.index] = true;
                  }
                  print(widget.add_to_cart_items);

                  // Toggle the add to cart value
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: MediaQuery.of(context).size.width*0.13,
                height: MediaQuery.of(context).size.height*0.15,
                decoration: BoxDecoration(
                  color: widget.imageS[widget.index] ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          if (showanimation ==true)

            Positioned(
              bottom: 350,
              left: 100,
              child: SizedBox(
                width: 100, // Fixed width for the Lottie animation
                height: 100, // Fixed height for the Lottie animation
                child: Loti1(reciver: widget.imageS[widget.index], onAnimationComplete: () {setState(() {
                  showanimation = false;
                });  }, ),
              ),
            ),
        ],
    );
  }
}
