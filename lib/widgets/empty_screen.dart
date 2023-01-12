import 'package:flutter/material.dart';
import 'package:grocery_app/consts/feeds_screen.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class EmptyScreen extends StatelessWidget {
  final String title, subtitle, buttonText, imagePath;
  EmptyScreen(
      {required this.title,
      required this.subtitle,
      required this.buttonText,
      required this.imagePath});
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(imagePath),
            TextWidget(
              text: title,
              color: Colors.red.withOpacity(0.8),
              textSize: 40,
              isTitle: true,
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            InkWell(
              child: Container(
                  width: size.width * 0.3,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      color: Colors.cyan.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: TextWidget(
                      text: buttonText,
                      color: color,
                      textSize: 20,
                      isTitle: true,
                    ),
                  )),
              onTap: () {
                GlobalMethods.navigatTo(
                    context: context, routeName: FeedsScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
