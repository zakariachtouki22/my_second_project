import 'package:flutter/material.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class AuthBTN extends StatelessWidget {
  final VoidCallback fct;
  final Color btncolor;
  final String buttonText;
  AuthBTN({required this.fct, required this.buttonText, required this.btncolor});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: btncolor,
          ),
          onPressed: fct,
          child: TextWidget(
            text: buttonText,
            color: Colors.white,
            textSize: 18,
          )),
    );
  }
}
