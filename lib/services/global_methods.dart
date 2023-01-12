import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class GlobalMethods {
  static navigatTo({required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }

  static Future<void> warningDialog(
      {required BuildContext context,required String title, required String subtitle,required VoidCallback fct}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/warring.png',
                  width: 20,
                  height: 20,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(title),
              ],
            ),
            content: Text(subtitle),
            actions: [
              TextButton(
                  onPressed: (){if (Navigator.canPop(context)) {
                              Navigator.pop(context);}
                            },
                  child: TextWidget(
                    text: 'Cancel',
                    textSize: 18,
                    color: Colors.cyan,
                  )),
              TextButton(
                  onPressed: fct,
                  child: TextWidget(
                    text: 'Ok',
                    textSize: 18,
                    color: Colors.red,
                  ))
            ],
          );
        });
  }
}
