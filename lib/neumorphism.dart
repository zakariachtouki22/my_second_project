import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class Nuemorphism extends StatefulWidget {
  @override
  State<Nuemorphism> createState() => _NuemorphismState();
}

class _NuemorphismState extends State<Nuemorphism> {
  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = const Color(0xFFE7ECEF);
    Offset distance = isPressed ? Offset(10, 10) : Offset(28, 28);
    double blur = isPressed ? 5.0 : 30.0;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isPressed = !isPressed;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                    inset: isPressed,
                    offset: -distance,
                    color: Colors.white),
                BoxShadow(
                    inset: isPressed,
                    offset: distance,
                    color: Color(0xFFA7A9AF)),
              ],
            ),
            child: SizedBox(
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
