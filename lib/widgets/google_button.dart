import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class GoogleBTN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: Image.asset(
                  'assets/images/cat/a9.png',
                  width: 40,
                )),
            SizedBox(
              width: 10,
            ),
            Flexible(
                flex: 5,
                child: TextWidget(
                    text: 'Sign in with google',
                    color: Colors.white,
                    textSize: 18)),
          ],
        ),
      ),
    );
  }
}
