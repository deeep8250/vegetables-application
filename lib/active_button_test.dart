import 'package:flutter/material.dart';
import 'loti_animation.dart';

class Active1 extends StatefulWidget {
  final int index;
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
    List<Map< String, dynamic >> imageMap = List.generate(
        widget.image.length, (index)=> {'link': '', 'price': 0, 'quantity': 0},
    );
    for(int i = 0 ; i < widget.image.length ; i ++){
      imageMap[i]['link'] = widget.image[i];
      imageMap[i]['price'] = widget.index;
    }


    final imageSelect = widget.image[widget.index];
       print('image selected $imageSelect');



    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine screen size and assign specific values based on device size
        double buttonWidth = constraints.maxWidth > 600 ? 240 : 200;
        double buttonHeight = constraints.maxWidth > 600 ? 100 : 80; // Reduced height for mobile

        return Stack(
          children: [
            Positioned(
              // Center the button under the fruit image for all screen sizes
              top: constraints.maxHeight * 0.7,
              // Adjust this to control vertical alignment
              left: (constraints.maxWidth - buttonWidth) / 2,
              // Center horizontally
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.imageS[widget.index] == true) {
                      widget.add_to_cart_items[widget.index] = widget.image[widget.index];
                      widget.imageS[widget.index] = false;
                      showanimation = true;
                    } else {
                      widget.add_to_cart_items[widget.index] = '';
                      widget.imageS[widget.index] = true;
                    }
                    print(widget.add_to_cart_items);
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: buttonWidth,
                  height: buttonHeight,
                  // Dynamic height based on screen size
                  decoration: BoxDecoration(
                    color: widget.imageS[widget.index]
                        ? Colors.green
                        : Colors.redAccent,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      widget.imageS[widget.index]
                          ? 'Add to card'
                          : 'Remove from card',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: widget.imageS[widget.index] ? 25 : 20,
                        fontFamily: 'cute',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (showanimation == true)
              Positioned(
                bottom: 380,
                left: constraints.maxWidth * 0.3,
                child: SizedBox(
                  width: constraints.maxWidth * 0.4,
                  // Fixed width for the Lottie animation
                  height: constraints.maxHeight * 0.4,
                  // Fixed height for the Lottie animation
                  child: Loti1(
                    reciver: widget.imageS[widget.index],
                    onAnimationComplete: () {
                      setState(() {
                        showanimation = false;
                      });
                    },
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
